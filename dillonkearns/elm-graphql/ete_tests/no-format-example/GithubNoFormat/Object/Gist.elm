-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Object.Gist exposing (..)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.SelectionSet exposing (SelectionSet)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import GithubNoFormat.Object
import GithubNoFormat.Interface
import GithubNoFormat.Union
import GithubNoFormat.Scalar
import GithubNoFormat.InputObject
import GithubNoFormat.ScalarCodecs
import Json.Decode as Decode
import Graphql.Internal.Encode as Encode exposing (Value)

type alias CommentsOptionalArguments = { first : OptionalArgument Int
 , after : OptionalArgument String
 , last : OptionalArgument Int
 , before : OptionalArgument String }

{-| A list of comments associated with the gist

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
comments : (CommentsOptionalArguments -> CommentsOptionalArguments)
 -> SelectionSet decodesTo GithubNoFormat.Object.GistCommentConnection
 -> SelectionSet decodesTo GithubNoFormat.Object.Gist
comments fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs____ =
            [ Argument.optional "first" filledInOptionals____.first (Encode.int), Argument.optional "after" filledInOptionals____.after (Encode.string), Argument.optional "last" filledInOptionals____.last (Encode.int), Argument.optional "before" filledInOptionals____.before (Encode.string) ]
                |> List.filterMap Basics.identity
    in
      Object.selectionForCompositeField "comments" optionalArgs____ (object____) (Basics.identity)


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet GithubNoFormat.ScalarCodecs.DateTime GithubNoFormat.Object.Gist
createdAt =
      Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The gist description.
-}
description : SelectionSet (Maybe String) GithubNoFormat.Object.Gist
description =
      Object.selectionForField "(Maybe String)" "description" [] (Decode.string |> Decode.nullable)


id : SelectionSet GithubNoFormat.ScalarCodecs.Id GithubNoFormat.Object.Gist
id =
      Object.selectionForField "ScalarCodecs.Id" "id" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Whether the gist is public or not.
-}
isPublic : SelectionSet Bool GithubNoFormat.Object.Gist
isPublic =
      Object.selectionForField "Bool" "isPublic" [] (Decode.bool)


{-| The gist name.
-}
name : SelectionSet String GithubNoFormat.Object.Gist
name =
      Object.selectionForField "String" "name" [] (Decode.string)


{-| The gist owner.
-}
owner : SelectionSet decodesTo GithubNoFormat.Interface.RepositoryOwner
 -> SelectionSet (Maybe decodesTo) GithubNoFormat.Object.Gist
owner object____ =
      Object.selectionForCompositeField "owner" [] (object____) (Basics.identity >> Decode.nullable)


{-| Identifies when the gist was last pushed to.
-}
pushedAt : SelectionSet (Maybe GithubNoFormat.ScalarCodecs.DateTime) GithubNoFormat.Object.Gist
pushedAt =
      Object.selectionForField "(Maybe ScalarCodecs.DateTime)" "pushedAt" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecDateTime |> .decoder |> Decode.nullable)


type alias StargazersOptionalArguments = { first : OptionalArgument Int
 , after : OptionalArgument String
 , last : OptionalArgument Int
 , before : OptionalArgument String
 , orderBy : OptionalArgument GithubNoFormat.InputObject.StarOrder }

{-| A list of users who have starred this starrable.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - orderBy - Order for connection

-}
stargazers : (StargazersOptionalArguments -> StargazersOptionalArguments)
 -> SelectionSet decodesTo GithubNoFormat.Object.StargazerConnection
 -> SelectionSet decodesTo GithubNoFormat.Object.Gist
stargazers fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { first = Absent, after = Absent, last = Absent, before = Absent, orderBy = Absent }

        optionalArgs____ =
            [ Argument.optional "first" filledInOptionals____.first (Encode.int), Argument.optional "after" filledInOptionals____.after (Encode.string), Argument.optional "last" filledInOptionals____.last (Encode.int), Argument.optional "before" filledInOptionals____.before (Encode.string), Argument.optional "orderBy" filledInOptionals____.orderBy (GithubNoFormat.InputObject.encodeStarOrder) ]
                |> List.filterMap Basics.identity
    in
      Object.selectionForCompositeField "stargazers" optionalArgs____ (object____) (Basics.identity)


{-| Identifies the date and time when the object was last updated.
@deprecated General type updated timestamps will eventually be replaced by other field specific timestamps. Removal on 2018-07-01 UTC.
-}
updatedAt : SelectionSet GithubNoFormat.ScalarCodecs.DateTime GithubNoFormat.Object.Gist
updatedAt =
      Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| Returns a boolean indicating whether the viewing user has starred this starrable.
-}
viewerHasStarred : SelectionSet Bool GithubNoFormat.Object.Gist
viewerHasStarred =
      Object.selectionForField "Bool" "viewerHasStarred" [] (Decode.bool)
