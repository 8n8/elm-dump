-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Enum.RepositoryAffiliation exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The affiliation of a user to a repository

  - Owner - Repositories that are owned by the authenticated user.
  - Collaborator - Repositories that the user has been added to as a collaborator.
  - OrganizationMember - Repositories that the user has access to through being a member of an organization. This includes every repository on every team that the user is on.

-}
type RepositoryAffiliation
    = Owner
    | Collaborator
    | OrganizationMember
list : List RepositoryAffiliation
list =
    [Owner, Collaborator, OrganizationMember]
decoder : Decoder RepositoryAffiliation
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "OWNER" ->
                        Decode.succeed Owner

                    "COLLABORATOR" ->
                        Decode.succeed Collaborator

                    "ORGANIZATION_MEMBER" ->
                        Decode.succeed OrganizationMember

                    _ ->
                        Decode.fail ("Invalid RepositoryAffiliation type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
        )
        

{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : RepositoryAffiliation -> String
toString enum____ =
    case enum____ of
        Owner ->
                "OWNER"


        Collaborator ->
                "COLLABORATOR"


        OrganizationMember ->
                "ORGANIZATION_MEMBER"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe RepositoryAffiliation
fromString enumString____ =
    case enumString____ of
        "OWNER" ->
                Just Owner


        "COLLABORATOR" ->
                Just Collaborator


        "ORGANIZATION_MEMBER" ->
                Just OrganizationMember

        _ ->
                Nothing
