module Terminal.Terminal.Helpers exposing
    ( elmFile
    , package
    , parseElmFile
    , parsePackage
    , parseVersion
    , version
    )

import Builder.Deps.Registry as Registry
import Builder.Stuff as Stuff
import Compiler.Elm.Package as Pkg
import Compiler.Elm.Version as V
import Compiler.Parse.Primitives as P
import Compiler.Reporting.Suggest as Suggest
import Data.IO as IO exposing (IO)
import Data.Map as Dict
import Terminal.Terminal.Internal exposing (Parser(..))
import Utils.Main as Utils exposing (FilePath)



-- VERSION


version : Parser
version =
    Parser
        { singular = "version"
        , plural = "versions"
        , suggest = suggestVersion
        , examples = IO.pure << exampleVersions
        }


parseVersion : String -> Maybe V.Version
parseVersion chars =
    case P.fromByteString V.parser Tuple.pair chars of
        Ok vsn ->
            Just vsn

        Err _ ->
            Nothing


suggestVersion : String -> IO (List String)
suggestVersion _ =
    IO.pure []


exampleVersions : String -> List String
exampleVersions chars =
    let
        chunks =
            String.split "." chars

        isNumber cs =
            not (String.isEmpty cs) && String.all Char.isDigit cs
    in
    if List.all isNumber chunks then
        case chunks of
            [ x ] ->
                [ x ++ ".0.0" ]

            [ x, y ] ->
                [ x ++ "." ++ y ++ ".0" ]

            x :: y :: z :: _ ->
                [ x ++ "." ++ y ++ "." ++ z ]

            _ ->
                [ "1.0.0", "2.0.3" ]

    else
        [ "1.0.0", "2.0.3" ]



-- ELM FILE


elmFile : Parser
elmFile =
    Parser
        { singular = "elm file"
        , plural = "elm files"
        , suggest = \_ -> IO.pure []
        , examples = exampleElmFiles
        }


parseElmFile : String -> Maybe FilePath
parseElmFile chars =
    if Utils.fpTakeExtension chars == ".elm" then
        Just chars

    else
        Nothing


exampleElmFiles : String -> IO (List String)
exampleElmFiles _ =
    IO.pure [ "Main.elm", "src/Main.elm" ]



-- PACKAGE


package : Parser
package =
    Parser
        { singular = "package"
        , plural = "packages"
        , suggest = suggestPackages
        , examples = examplePackages
        }


parsePackage : String -> Maybe Pkg.Name
parsePackage chars =
    case P.fromByteString Pkg.parser Tuple.pair chars of
        Ok pkg ->
            Just pkg

        Err _ ->
            Nothing


suggestPackages : String -> IO (List String)
suggestPackages given =
    Stuff.getPackageCache
        |> IO.bind
            (\cache ->
                Registry.read cache
                    |> IO.fmap
                        (\maybeRegistry ->
                            case maybeRegistry of
                                Nothing ->
                                    []

                                Just (Registry.Registry _ versions) ->
                                    List.filter (String.startsWith given) <|
                                        List.map Pkg.toChars (Dict.keys versions)
                        )
            )


examplePackages : String -> IO (List String)
examplePackages given =
    Stuff.getPackageCache
        |> IO.bind
            (\cache ->
                Registry.read cache
                    |> IO.fmap
                        (\maybeRegistry ->
                            case maybeRegistry of
                                Nothing ->
                                    [ "elm/json"
                                    , "elm/http"
                                    , "elm/random"
                                    ]

                                Just (Registry.Registry _ versions) ->
                                    List.map Pkg.toChars <|
                                        List.take 4 <|
                                            Suggest.sort given Pkg.toChars (Dict.keys versions)
                        )
            )