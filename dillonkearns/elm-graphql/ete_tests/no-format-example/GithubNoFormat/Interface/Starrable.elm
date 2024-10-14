-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Interface.Starrable exposing (..)

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
    onGist : SelectionSet decodesTo GithubNoFormat.Object.Gist,
 onRepository : SelectionSet decodesTo GithubNoFormat.Object.Repository
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
      Fragments decodesTo
      -> SelectionSet decodesTo GithubNoFormat.Interface.Starrable
fragments selections____ =
    Object.exhaustiveFragmentSelection
        [
         Object.buildFragment "Gist" selections____.onGist,
 Object.buildFragment "Repository" selections____.onRepository
        ]


{-| Can be used to create a non-exhaustive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    {
      onGist = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing),
 onRepository = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }
id : SelectionSet GithubNoFormat.ScalarCodecs.Id GithubNoFormat.Interface.Starrable
id =
      Object.selectionForField "ScalarCodecs.Id" "id" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecId |> .decoder)


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
 -> SelectionSet decodesTo GithubNoFormat.Interface.Starrable
stargazers fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { first = Absent, after = Absent, last = Absent, before = Absent, orderBy = Absent }

        optionalArgs____ =
            [ Argument.optional "first" filledInOptionals____.first (Encode.int), Argument.optional "after" filledInOptionals____.after (Encode.string), Argument.optional "last" filledInOptionals____.last (Encode.int), Argument.optional "before" filledInOptionals____.before (Encode.string), Argument.optional "orderBy" filledInOptionals____.orderBy (GithubNoFormat.InputObject.encodeStarOrder) ]
                |> List.filterMap Basics.identity
    in
      Object.selectionForCompositeField "stargazers" optionalArgs____ (object____) (Basics.identity)


{-| Returns a boolean indicating whether the viewing user has starred this starrable.
-}
viewerHasStarred : SelectionSet Bool GithubNoFormat.Interface.Starrable
viewerHasStarred =
      Object.selectionForField "Bool" "viewerHasStarred" [] (Decode.bool)
