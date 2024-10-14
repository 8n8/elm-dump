{- MANUALLY FORMATTED -}
module Compiler.Parse.Declaration exposing
  ( Decl(..)
  , declaration
  , infix_
  )


import Compiler.AST.Source as Src
import Compiler.AST.Utils.Binop as Binop
import Compiler.Data.Name as Name
import Compiler.Parse.Expression as Expr
import Compiler.Parse.Keyword as Keyword
import Compiler.Parse.Number as Number
import Compiler.Parse.Pattern as Pattern
import Compiler.Parse.Primitives as P
import Compiler.Parse.Space as Space
import Compiler.Parse.Symbol as Symbol
import Compiler.Parse.Type as Type
import Compiler.Parse.Variable as Var
import Compiler.Reporting.Annotation as A
import Compiler.Reporting.Error.Syntax as E
import Extra.Type.List as MList exposing (TList)



-- DECLARATION


type Decl
  = Value (Maybe Src.Comment) (A.Located Src.Value)
  | Union (Maybe Src.Comment) (A.Located Src.Union)
  | Alias (Maybe Src.Comment) (A.Located Src.Alias)
  | Port (Maybe Src.Comment) Src.Port


declaration : Space.Parser z E.Decl Decl
declaration =
  P.bind chompDocComment <| \maybeDocs ->
  P.bind P.getPosition <| \start ->
  P.oneOf E.DeclStart
    [ typeDecl maybeDocs start
    , portDecl maybeDocs
    , valueDecl maybeDocs start
    ]



-- DOC COMMENT


chompDocComment : P.Parser z E.Decl (Maybe Src.Comment)
chompDocComment =
  P.oneOfWithFallback
    [
      P.bind (Space.docComment E.DeclStart E.DeclSpace) <| \docComment ->
      P.bind (Space.chomp E.DeclSpace) <| \_ ->
      P.bind (Space.checkFreshLine E.DeclFreshLineAfterDocComment) <| \_ ->
      P.return (Just docComment)
    ]
    Nothing



-- DEFINITION and ANNOTATION


valueDecl : Maybe Src.Comment -> A.Position -> Space.Parser z E.Decl Decl
valueDecl maybeDocs start =
  P.bind (Var.lower E.DeclStart) <| \name ->
  P.bind P.getPosition <| \end ->
  P.specialize (E.DeclDef name) <|
    P.bind (Space.chompAndCheckIndent E.DeclDefSpace E.DeclDefIndentEquals) <| \_ ->
    P.oneOf E.DeclDefEquals
      [
        P.bind (P.word1 0x3A {-:-} E.DeclDefEquals) <| \_ ->
        P.bind (Space.chompAndCheckIndent E.DeclDefSpace E.DeclDefIndentType) <| \_ ->
        P.bind (P.specialize E.DeclDefType Type.expression) <| \(tipe, _) ->
        P.bind (Space.checkFreshLine E.DeclDefNameRepeat) <| \_ ->
        P.bind (chompMatchingName name) <| \defName ->
        P.bind (Space.chompAndCheckIndent E.DeclDefSpace E.DeclDefIndentEquals) <| \_ ->
        chompDefArgsAndBody maybeDocs start defName (Just tipe) []
      ,
        chompDefArgsAndBody maybeDocs start (A.at start end name) Nothing []
      ]


chompDefArgsAndBody : Maybe Src.Comment -> A.Position -> A.Located Name.Name -> Maybe Src.Type -> TList Src.Pattern -> Space.Parser z E.DeclDef Decl
chompDefArgsAndBody maybeDocs start name tipe revArgs =
  P.oneOf E.DeclDefEquals
    [ P.bind (P.specialize E.DeclDefArg Pattern.term) <| \arg ->
      P.bind (Space.chompAndCheckIndent E.DeclDefSpace E.DeclDefIndentEquals) <| \_ ->
      chompDefArgsAndBody maybeDocs start name tipe (arg :: revArgs)
    , P.bind (P.word1 0x3D {-=-} E.DeclDefEquals) <| \_ ->
      P.bind (Space.chompAndCheckIndent E.DeclDefSpace E.DeclDefIndentBody) <| \_ ->
      P.bind (P.specialize E.DeclDefBody Expr.expression) <| \(body, end) ->
      let value = Src.Value name (MList.reverse revArgs) body tipe in
      let avalue = A.at start end value in
      P.return (Value maybeDocs avalue, end)
    ]


chompMatchingName : Name.Name -> P.Parser z E.DeclDef (A.Located Name.Name)
chompMatchingName expectedName =
  let
    (P.Parser parserL) = Var.lower E.DeclDefNameRepeat
  in
  P.Parser <| \((P.State _ _ _ _ sr sc) as state) cok eok cerr eerr ->
    let
      cokL name ((P.State _ _ _ _ er ec) as newState) =
        if expectedName == name
        then cok (A.At (A.Region (A.Position sr sc) (A.Position er ec)) name) newState
        else cerr sr sc (E.DeclDefNameMatch name)

      eokL name ((P.State _ _ _ _ er ec) as newState) =
        if expectedName == name
        then eok (A.At (A.Region (A.Position sr sc) (A.Position er ec)) name) newState
        else eerr sr sc (E.DeclDefNameMatch name)
    in
    parserL state cokL eokL cerr eerr



-- TYPE DECLARATIONS


typeDecl : Maybe Src.Comment -> A.Position -> Space.Parser z E.Decl Decl
typeDecl maybeDocs start =
  P.inContext E.DeclType (Keyword.type_ E.DeclStart) <|
    P.bind (Space.chompAndCheckIndent E.DT_Space E.DT_IndentName) <| \_ ->
    P.oneOf E.DT_Name
      [
        P.inContext E.DT_Alias (Keyword.alias_ E.DT_Name) <|
          P.bind (Space.chompAndCheckIndent E.AliasSpace E.AliasIndentEquals) <| \_ ->
          P.bind chompAliasNameToEquals <| \(name, args) ->
          P.bind (P.specialize E.AliasBody Type.expression) <| \(tipe, end) ->
          let alias = A.at start end (Src.Alias name args tipe) in
          P.return (Alias maybeDocs alias, end)
      ,
        P.specialize E.DT_Union <|
          P.bind chompCustomNameToEquals <| \(name, args) ->
          P.bind Type.variant <| \(firstVariant, firstEnd) ->
          P.bind (chompVariants [firstVariant] firstEnd) <| \(variants, end) ->
          let union = A.at start end (Src.Union name args variants) in
          P.return (Union maybeDocs union, end)
      ]



-- TYPE ALIASES


chompAliasNameToEquals : P.Parser z E.TypeAlias (A.Located Name.Name, TList (A.Located Name.Name))
chompAliasNameToEquals =
  P.bind (P.addLocation (Var.upper E.AliasName)) <| \name ->
  P.bind (Space.chompAndCheckIndent E.AliasSpace E.AliasIndentEquals) <| \_ ->
  chompAliasNameToEqualsHelp name []


chompAliasNameToEqualsHelp : A.Located Name.Name -> TList (A.Located Name.Name) -> P.Parser z E.TypeAlias (A.Located Name.Name, TList (A.Located Name.Name))
chompAliasNameToEqualsHelp name args =
  P.oneOf E.AliasEquals
    [ P.bind (P.addLocation (Var.lower E.AliasEquals)) <| \arg ->
      P.bind (Space.chompAndCheckIndent E.AliasSpace E.AliasIndentEquals) <| \_ ->
      chompAliasNameToEqualsHelp name (arg::args)
    , P.bind (P.word1 0x3D {-=-} E.AliasEquals) <| \_ ->
      P.bind (Space.chompAndCheckIndent E.AliasSpace E.AliasIndentBody) <| \_ ->
      P.return ( name, MList.reverse args )
    ]



-- CUSTOM TYPES


chompCustomNameToEquals : P.Parser z E.CustomType (A.Located Name.Name, TList (A.Located Name.Name))
chompCustomNameToEquals =
  P.bind (P.addLocation (Var.upper E.CT_Name)) <| \name ->
  P.bind (Space.chompAndCheckIndent E.CT_Space E.CT_IndentEquals) <| \_ ->
  chompCustomNameToEqualsHelp name []


chompCustomNameToEqualsHelp : A.Located Name.Name -> TList (A.Located Name.Name) -> P.Parser z E.CustomType (A.Located Name.Name, TList (A.Located Name.Name))
chompCustomNameToEqualsHelp name args =
  P.oneOf E.CT_Equals
    [ P.bind (P.addLocation (Var.lower E.CT_Equals)) <| \arg ->
      P.bind (Space.chompAndCheckIndent E.CT_Space E.CT_IndentEquals) <| \_ ->
      chompCustomNameToEqualsHelp name (arg::args)
    , P.bind (P.word1 0x3D {-=-} E.CT_Equals) <| \_ ->
      P.bind (Space.chompAndCheckIndent E.CT_Space E.CT_IndentAfterEquals) <| \_ ->
      P.return ( name, MList.reverse args )
    ]


chompVariants : TList (A.Located Name.Name, TList Src.Type) -> A.Position -> Space.Parser z E.CustomType (TList (A.Located Name.Name, TList Src.Type))
chompVariants variants end =
  P.oneOfWithFallback
    [ P.bind (Space.checkIndent end E.CT_IndentBar) <| \_ ->
      P.bind (P.word1 0x7C {- | -} E.CT_Bar) <| \_ ->
      P.bind (Space.chompAndCheckIndent E.CT_Space E.CT_IndentAfterBar) <| \_ ->
      P.bind Type.variant <| \(variant, newEnd) ->
      chompVariants (variant::variants) newEnd
    ]
    (MList.reverse variants, end)



-- PORT


portDecl : Maybe Src.Comment -> Space.Parser z E.Decl Decl
portDecl maybeDocs =
  P.inContext E.Port (Keyword.port_ E.DeclStart) <|
    P.bind (Space.chompAndCheckIndent E.PortSpace E.PortIndentName) <| \_ ->
    P.bind (P.addLocation (Var.lower E.PortName)) <| \name ->
    P.bind (Space.chompAndCheckIndent E.PortSpace E.PortIndentColon) <| \_ ->
    P.bind (P.word1 0x3A {-:-} E.PortColon) <| \_ ->
    P.bind (Space.chompAndCheckIndent E.PortSpace E.PortIndentType) <| \_ ->
    P.bind (P.specialize E.PortType Type.expression) <| \(tipe, end) ->
    P.return
      ( Port maybeDocs (Src.Port name tipe)
      , end
      )



-- INFIX


-- INVARIANT: always chomps to a freshline
--
infix_ : P.Parser z E.Module (A.Located Src.Infix)
infix_ =
  let
    err = E.Infix
    err_ = \_ -> E.Infix
  in
  P.bind P.getPosition <| \start ->
  P.bind (Keyword.infix_ err) <| \_ ->
  P.bind (Space.chompAndCheckIndent err_ err) <| \_ ->
  P.bind
    (P.oneOf err
      [ P.bind (Keyword.left_  err) <| \_ -> P.return Binop.Left
      , P.bind (Keyword.right_ err) <| \_ -> P.return Binop.Right
      , P.bind (Keyword.non_   err) <| \_ -> P.return Binop.Non
      ]) <| \associativity ->
  P.bind (Space.chompAndCheckIndent err_ err) <| \_ ->
  P.bind (Number.precedence err) <| \precedence ->
  P.bind (Space.chompAndCheckIndent err_ err) <| \_ ->
  P.bind (P.word1 0x28 {-(-} err) <| \_ ->
  P.bind (Symbol.operator err err_) <| \op ->
  P.bind (P.word1 0x29 {-)-} err) <| \_ ->
  P.bind (Space.chompAndCheckIndent err_ err) <| \_ ->
  P.bind (P.word1 0x3D {-=-} err) <| \_ ->
  P.bind (Space.chompAndCheckIndent err_ err) <| \_ ->
  P.bind (Var.lower err) <| \name ->
  P.bind P.getPosition <| \end ->
  P.bind (Space.chomp err_) <| \_ ->
  P.bind (Space.checkFreshLine err) <| \_ ->
  P.return (A.at start end (Src.Infix op associativity precedence name))