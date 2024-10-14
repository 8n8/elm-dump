-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Object.CommitConnection exposing (..)

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

{-| A list of edges.
-}
edges : SelectionSet decodesTo GithubNoFormat.Object.CommitEdge
 -> SelectionSet (Maybe (List (Maybe decodesTo))) GithubNoFormat.Object.CommitConnection
edges object____ =
      Object.selectionForCompositeField "edges" [] (object____) (Basics.identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| A list of nodes.
-}
nodes : SelectionSet decodesTo GithubNoFormat.Object.Commit
 -> SelectionSet (Maybe (List (Maybe decodesTo))) GithubNoFormat.Object.CommitConnection
nodes object____ =
      Object.selectionForCompositeField "nodes" [] (object____) (Basics.identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| Information to aid in pagination.
-}
pageInfo : SelectionSet decodesTo GithubNoFormat.Object.PageInfo
 -> SelectionSet decodesTo GithubNoFormat.Object.CommitConnection
pageInfo object____ =
      Object.selectionForCompositeField "pageInfo" [] (object____) (Basics.identity)


{-| Identifies the total count of items in the connection.
-}
totalCount : SelectionSet Int GithubNoFormat.Object.CommitConnection
totalCount =
      Object.selectionForField "Int" "totalCount" [] (Decode.int)
