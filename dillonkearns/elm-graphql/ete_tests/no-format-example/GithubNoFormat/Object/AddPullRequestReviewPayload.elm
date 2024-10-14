-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Object.AddPullRequestReviewPayload exposing (..)

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

{-| A unique identifier for the client performing the mutation.
-}
clientMutationId : SelectionSet (Maybe String) GithubNoFormat.Object.AddPullRequestReviewPayload
clientMutationId =
      Object.selectionForField "(Maybe String)" "clientMutationId" [] (Decode.string |> Decode.nullable)


{-| The newly created pull request review.
-}
pullRequestReview : SelectionSet decodesTo GithubNoFormat.Object.PullRequestReview
 -> SelectionSet decodesTo GithubNoFormat.Object.AddPullRequestReviewPayload
pullRequestReview object____ =
      Object.selectionForCompositeField "pullRequestReview" [] (object____) (Basics.identity)


{-| The edge from the pull request's review connection.
-}
reviewEdge : SelectionSet decodesTo GithubNoFormat.Object.PullRequestReviewEdge
 -> SelectionSet decodesTo GithubNoFormat.Object.AddPullRequestReviewPayload
reviewEdge object____ =
      Object.selectionForCompositeField "reviewEdge" [] (object____) (Basics.identity)
