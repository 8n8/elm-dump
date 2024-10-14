-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.ReviewRequest exposing (..)

import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.ScalarCodecs
import Github.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Identifies the primary key from the database.
@deprecated Exposed database IDs will eventually be removed in favor of global Relay IDs. Use `Node.id` instead. Removal on 2018-07-01 UTC.
-}
databaseId : SelectionSet (Maybe Int) Github.Object.ReviewRequest
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.ReviewRequest
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Identifies the pull request associated with this review request.
-}
pullRequest :
    SelectionSet decodesTo Github.Object.PullRequest
    -> SelectionSet decodesTo Github.Object.ReviewRequest
pullRequest object____ =
    Object.selectionForCompositeField "pullRequest" [] object____ Basics.identity


{-| The reviewer that is requested.
-}
requestedReviewer :
    SelectionSet decodesTo Github.Union.RequestedReviewer
    -> SelectionSet (Maybe decodesTo) Github.Object.ReviewRequest
requestedReviewer object____ =
    Object.selectionForCompositeField "requestedReviewer" [] object____ (Basics.identity >> Decode.nullable)


{-| Identifies the author associated with this review request.
@deprecated Field `reviewer` will be changed in favor of returning a union type. Use `ReviewRequest.requestedReviewer` instead. Removal on 2018-07-01 UTC.
-}
reviewer :
    SelectionSet decodesTo Github.Object.User
    -> SelectionSet (Maybe decodesTo) Github.Object.ReviewRequest
reviewer object____ =
    Object.selectionForCompositeField "reviewer" [] object____ (Basics.identity >> Decode.nullable)
