-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Interface.UniformResourceLocatable exposing (..)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.SelectionSet exposing (FragmentSelectionSet(..), SelectionSet(..))
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import GithubNoFormat.Object
import GithubNoFormat.Interface
import GithubNoFormat.Union
import GithubNoFormat.Scalar
import GithubNoFormat.InputObject
import GithubNoFormat.ScalarCodecs
import Json.Decode as Decode
import Graphql.Internal.Encode as Encode exposing (Value)


type alias Fragments decodesTo =
    {
    onBot : SelectionSet decodesTo GithubNoFormat.Object.Bot,
 onCrossReferencedEvent : SelectionSet decodesTo GithubNoFormat.Object.CrossReferencedEvent,
 onIssue : SelectionSet decodesTo GithubNoFormat.Object.Issue,
 onMergedEvent : SelectionSet decodesTo GithubNoFormat.Object.MergedEvent,
 onMilestone : SelectionSet decodesTo GithubNoFormat.Object.Milestone,
 onOrganization : SelectionSet decodesTo GithubNoFormat.Object.Organization,
 onPullRequest : SelectionSet decodesTo GithubNoFormat.Object.PullRequest,
 onPullRequestCommit : SelectionSet decodesTo GithubNoFormat.Object.PullRequestCommit,
 onRelease : SelectionSet decodesTo GithubNoFormat.Object.Release,
 onRepository : SelectionSet decodesTo GithubNoFormat.Object.Repository,
 onRepositoryTopic : SelectionSet decodesTo GithubNoFormat.Object.RepositoryTopic,
 onReviewDismissedEvent : SelectionSet decodesTo GithubNoFormat.Object.ReviewDismissedEvent,
 onUser : SelectionSet decodesTo GithubNoFormat.Object.User
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
      Fragments decodesTo
      -> SelectionSet decodesTo GithubNoFormat.Interface.UniformResourceLocatable
fragments selections____ =
    Object.exhaustiveFragmentSelection
        [
         Object.buildFragment "Bot" selections____.onBot,
 Object.buildFragment "CrossReferencedEvent" selections____.onCrossReferencedEvent,
 Object.buildFragment "Issue" selections____.onIssue,
 Object.buildFragment "MergedEvent" selections____.onMergedEvent,
 Object.buildFragment "Milestone" selections____.onMilestone,
 Object.buildFragment "Organization" selections____.onOrganization,
 Object.buildFragment "PullRequest" selections____.onPullRequest,
 Object.buildFragment "PullRequestCommit" selections____.onPullRequestCommit,
 Object.buildFragment "Release" selections____.onRelease,
 Object.buildFragment "Repository" selections____.onRepository,
 Object.buildFragment "RepositoryTopic" selections____.onRepositoryTopic,
 Object.buildFragment "ReviewDismissedEvent" selections____.onReviewDismissedEvent,
 Object.buildFragment "User" selections____.onUser
        ]


{-| Can be used to create a non-exhaustive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    {
      onBot = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onCrossReferencedEvent = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onIssue = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onMergedEvent = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onMilestone = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onOrganization = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onPullRequest = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onPullRequestCommit = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onRelease = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onRepository = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onRepositoryTopic = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onReviewDismissedEvent = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onUser = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }
{-| The HTML path to this resource.
-}
resourcePath : SelectionSet GithubNoFormat.ScalarCodecs.Uri GithubNoFormat.Interface.UniformResourceLocatable
resourcePath =
      Object.selectionForField "ScalarCodecs.Uri" "resourcePath" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The URL to this resource.
-}
url : SelectionSet GithubNoFormat.ScalarCodecs.Uri GithubNoFormat.Interface.UniformResourceLocatable
url =
      Object.selectionForField "ScalarCodecs.Uri" "url" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecUri |> .decoder)
