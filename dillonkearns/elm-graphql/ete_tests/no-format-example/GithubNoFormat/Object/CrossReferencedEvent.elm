-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Object.CrossReferencedEvent exposing (..)

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

{-| Identifies the actor who performed the event.
-}
actor : SelectionSet decodesTo GithubNoFormat.Interface.Actor
 -> SelectionSet (Maybe decodesTo) GithubNoFormat.Object.CrossReferencedEvent
actor object____ =
      Object.selectionForCompositeField "actor" [] (object____) (Basics.identity >> Decode.nullable)


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet GithubNoFormat.ScalarCodecs.DateTime GithubNoFormat.Object.CrossReferencedEvent
createdAt =
      Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


id : SelectionSet GithubNoFormat.ScalarCodecs.Id GithubNoFormat.Object.CrossReferencedEvent
id =
      Object.selectionForField "ScalarCodecs.Id" "id" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Reference originated in a different repository.
-}
isCrossRepository : SelectionSet Bool GithubNoFormat.Object.CrossReferencedEvent
isCrossRepository =
      Object.selectionForField "Bool" "isCrossRepository" [] (Decode.bool)


{-| Identifies when the reference was made.
-}
referencedAt : SelectionSet GithubNoFormat.ScalarCodecs.DateTime GithubNoFormat.Object.CrossReferencedEvent
referencedAt =
      Object.selectionForField "ScalarCodecs.DateTime" "referencedAt" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The HTTP path for this pull request.
-}
resourcePath : SelectionSet GithubNoFormat.ScalarCodecs.Uri GithubNoFormat.Object.CrossReferencedEvent
resourcePath =
      Object.selectionForField "ScalarCodecs.Uri" "resourcePath" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| Issue or pull request that made the reference.
-}
source : SelectionSet decodesTo GithubNoFormat.Union.ReferencedSubject
 -> SelectionSet decodesTo GithubNoFormat.Object.CrossReferencedEvent
source object____ =
      Object.selectionForCompositeField "source" [] (object____) (Basics.identity)


{-| Issue or pull request to which the reference was made.
-}
target : SelectionSet decodesTo GithubNoFormat.Union.ReferencedSubject
 -> SelectionSet decodesTo GithubNoFormat.Object.CrossReferencedEvent
target object____ =
      Object.selectionForCompositeField "target" [] (object____) (Basics.identity)


{-| The HTTP URL for this pull request.
-}
url : SelectionSet GithubNoFormat.ScalarCodecs.Uri GithubNoFormat.Object.CrossReferencedEvent
url =
      Object.selectionForField "ScalarCodecs.Uri" "url" [] (GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| Checks if the target will be closed when the source is merged.
-}
willCloseTarget : SelectionSet Bool GithubNoFormat.Object.CrossReferencedEvent
willCloseTarget =
      Object.selectionForField "Bool" "willCloseTarget" [] (Decode.bool)
