-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.StarOrderField exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| Properties by which star connections can be ordered.

  - StarredAt - Allows ordering a list of stars by when they were created.

-}
type StarOrderField
    = StarredAt


list : List StarOrderField
list =
    [ StarredAt ]


decoder : Decoder StarOrderField
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "STARRED_AT" ->
                        Decode.succeed StarredAt

                    _ ->
                        Decode.fail ("Invalid StarOrderField type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : StarOrderField -> String
toString enum____ =
    case enum____ of
        StarredAt ->
            "STARRED_AT"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe StarOrderField
fromString enumString____ =
    case enumString____ of
        "STARRED_AT" ->
            Just StarredAt

        _ ->
            Nothing
