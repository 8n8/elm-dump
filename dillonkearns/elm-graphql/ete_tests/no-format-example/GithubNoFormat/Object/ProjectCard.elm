-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Object.ProjectCard exposing (..)

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
import GithubNoFormat.Enum.ProjectCardState
{-| The project column this card is associated under. A card may only belong to one
project column at a time. The column field will be null if the card is created
in a pending state and has yet to be associated with a column. Once cards are
associated with a column, they will not become pending in the future.

-}
column : SelectionSet decodesTo GithubNoFormat.Object.ProjectColumn
 -> SelectionSet (Maybe decodesTo) GithubNoFormat.Object.ProjectCard
column object____ =
      Object.selectionForCompositeField "column" [] (object____) (Basics.identity >> Decode.nullable)


{-| The card content item
-}
content : SelectionSet decodesTo GithubNoFormat.Union.ProjectCardItem
 -> SelectionSet (Maybe decodesTo) GithubNoFormat.Object.ProjectCard
content object____ =
      Object.selectionForCompositeField "content" [] (object____) (Basics.identity >> Decode.nullable)


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet GithubNoFormat.ScalarCodecs.DateTime GithubNoFormat.Object.ProjectCard
createdAt =
      Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The actor who created this card
-}
creator : SelectionSet decodesTo GithubNoFormat.Interface.Actor
 -> SelectionSet (Maybe decodesTo) GithubNoFormat.Object.ProjectCard
creator object____ =
      Object.selectionForCompositeField "creator" [] (object____) (Basics.identity >> Decode.nullable)


{-| Identifies the primary key from the database.
@deprecated Exposed database IDs will eventually be removed in favor of global Relay IDs. Use `Node.id` instead. Removal on 2018-07-01 UTC.
-}
databaseId : SelectionSet (Maybe Int) GithubNoFormat.Object.ProjectCard
databaseId =
      Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


id : SelectionSet GithubNoFormat.ScalarCodecs.Id GithubNoFormat.Object.ProjectCard
id =
      Object.selectionForField "ScalarCodecs.Id" "id" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The card note
-}
note : SelectionSet (Maybe String) GithubNoFormat.Object.ProjectCard
note =
      Object.selectionForField "(Maybe String)" "note" [] (Decode.string |> Decode.nullable)


{-| The project that contains this card.
-}
project : SelectionSet decodesTo GithubNoFormat.Object.Project
 -> SelectionSet decodesTo GithubNoFormat.Object.ProjectCard
project object____ =
      Object.selectionForCompositeField "project" [] (object____) (Basics.identity)


{-| The column that contains this card.
@deprecated The associated column may be null if the card is in a pending state. Use `ProjectCard.column` instead. Removal on 2018-07-01 UTC.
-}
projectColumn : SelectionSet decodesTo GithubNoFormat.Object.ProjectColumn
 -> SelectionSet decodesTo GithubNoFormat.Object.ProjectCard
projectColumn object____ =
      Object.selectionForCompositeField "projectColumn" [] (object____) (Basics.identity)


{-| The HTTP path for this card
-}
resourcePath : SelectionSet GithubNoFormat.ScalarCodecs.Uri GithubNoFormat.Object.ProjectCard
resourcePath =
      Object.selectionForField "ScalarCodecs.Uri" "resourcePath" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The state of ProjectCard
-}
state : SelectionSet (Maybe GithubNoFormat.Enum.ProjectCardState.ProjectCardState) GithubNoFormat.Object.ProjectCard
state =
      Object.selectionForField "(Maybe Enum.ProjectCardState.ProjectCardState)" "state" [] (GithubNoFormat.Enum.ProjectCardState.decoder |> Decode.nullable)


{-| Identifies the date and time when the object was last updated.
@deprecated General type updated timestamps will eventually be replaced by other field specific timestamps. Removal on 2018-07-01 UTC.
-}
updatedAt : SelectionSet GithubNoFormat.ScalarCodecs.DateTime GithubNoFormat.Object.ProjectCard
updatedAt =
      Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The HTTP URL for this card
-}
url : SelectionSet GithubNoFormat.ScalarCodecs.Uri GithubNoFormat.Object.ProjectCard
url =
      Object.selectionForField "ScalarCodecs.Uri" "url" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecUri |> .decoder)
