-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Query exposing (..)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)
import GithubNoFormat.Object
import GithubNoFormat.Interface
import GithubNoFormat.Union
import GithubNoFormat.Scalar
import GithubNoFormat.InputObject
import GithubNoFormat.ScalarCodecs
import Graphql.Internal.Builder.Object as Object
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Json.Decode as Decode exposing (Decoder)
import Graphql.Internal.Encode as Encode exposing (Value)
import GithubNoFormat.Enum.SearchType
type alias CodeOfConductRequiredArguments = { key : String }

{-| Look up a code of conduct by its key

  - key - The code of conduct's key

-}
codeOfConduct : CodeOfConductRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Object.CodeOfConduct
 -> SelectionSet (Maybe decodesTo) RootQuery
codeOfConduct requiredArgs____ object____ =
      Object.selectionForCompositeField "codeOfConduct" [ Argument.required "key" requiredArgs____.key (Encode.string) ] (object____) (Basics.identity >> Decode.nullable)


{-| Look up a code of conduct by its key
-}
codesOfConduct : SelectionSet decodesTo GithubNoFormat.Object.CodeOfConduct
 -> SelectionSet (Maybe (List (Maybe decodesTo))) RootQuery
codesOfConduct object____ =
      Object.selectionForCompositeField "codesOfConduct" [] (object____) (Basics.identity >> Decode.nullable >> Decode.list >> Decode.nullable)


type alias LicenseRequiredArguments = { key : String }

{-| Look up an open source license by its key

  - key - The license's downcased SPDX ID

-}
license : LicenseRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Object.License
 -> SelectionSet (Maybe decodesTo) RootQuery
license requiredArgs____ object____ =
      Object.selectionForCompositeField "license" [ Argument.required "key" requiredArgs____.key (Encode.string) ] (object____) (Basics.identity >> Decode.nullable)


{-| Return a list of known open source licenses
-}
licenses : SelectionSet decodesTo GithubNoFormat.Object.License
 -> SelectionSet (List (Maybe decodesTo)) RootQuery
licenses object____ =
      Object.selectionForCompositeField "licenses" [] (object____) (Basics.identity >> Decode.nullable >> Decode.list)


type alias MarketplaceCategoriesOptionalArguments = { excludeEmpty : OptionalArgument Bool }

{-| Get alphabetically sorted list of Marketplace categories

  - excludeEmpty - Exclude categories with no listings.

-}
marketplaceCategories : (MarketplaceCategoriesOptionalArguments -> MarketplaceCategoriesOptionalArguments)
 -> SelectionSet decodesTo GithubNoFormat.Object.MarketplaceCategory
 -> SelectionSet (List decodesTo) RootQuery
marketplaceCategories fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { excludeEmpty = Absent }

        optionalArgs____ =
            [ Argument.optional "excludeEmpty" filledInOptionals____.excludeEmpty (Encode.bool) ]
                |> List.filterMap Basics.identity
    in
      Object.selectionForCompositeField "marketplaceCategories" optionalArgs____ (object____) (Basics.identity >> Decode.list)


type alias MarketplaceCategoryRequiredArguments = { slug : String }

{-| Look up a Marketplace category by its slug.

  - slug - The URL slug of the category.

-}
marketplaceCategory : MarketplaceCategoryRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Object.MarketplaceCategory
 -> SelectionSet (Maybe decodesTo) RootQuery
marketplaceCategory requiredArgs____ object____ =
      Object.selectionForCompositeField "marketplaceCategory" [ Argument.required "slug" requiredArgs____.slug (Encode.string) ] (object____) (Basics.identity >> Decode.nullable)


type alias MarketplaceListingRequiredArguments = { slug : String }

{-| Look up a single Marketplace listing

  - slug - Select the listing that matches this slug. It's the short name of the listing used in its URL.

-}
marketplaceListing : MarketplaceListingRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Object.MarketplaceListing
 -> SelectionSet (Maybe decodesTo) RootQuery
marketplaceListing requiredArgs____ object____ =
      Object.selectionForCompositeField "marketplaceListing" [ Argument.required "slug" requiredArgs____.slug (Encode.string) ] (object____) (Basics.identity >> Decode.nullable)


type alias MarketplaceListingsOptionalArguments = { first : OptionalArgument Int
 , after : OptionalArgument String
 , last : OptionalArgument Int
 , before : OptionalArgument String
 , categorySlug : OptionalArgument String
 , viewerCanAdmin : OptionalArgument Bool
 , adminId : OptionalArgument GithubNoFormat.ScalarCodecs.Id
 , organizationId : OptionalArgument GithubNoFormat.ScalarCodecs.Id
 , allStates : OptionalArgument Bool
 , slugs : OptionalArgument (List (Maybe String))
 , primaryCategoryOnly : OptionalArgument Bool
 , withFreeTrialsOnly : OptionalArgument Bool }

{-| Look up Marketplace listings

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - categorySlug - Select only listings with the given category.
  - viewerCanAdmin - Select listings to which user has admin access. If omitted, listings visible to the
viewer are returned.

  - adminId - Select listings that can be administered by the specified user.
  - organizationId - Select listings for products owned by the specified organization.
  - allStates - Select listings visible to the viewer even if they are not approved. If omitted or
false, only approved listings will be returned.

  - slugs - Select the listings with these slugs, if they are visible to the viewer.
  - primaryCategoryOnly - Select only listings where the primary category matches the given category slug.
  - withFreeTrialsOnly - Select only listings that offer a free trial.

-}
marketplaceListings : (MarketplaceListingsOptionalArguments -> MarketplaceListingsOptionalArguments)
 -> SelectionSet decodesTo GithubNoFormat.Object.MarketplaceListingConnection
 -> SelectionSet decodesTo RootQuery
marketplaceListings fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { first = Absent, after = Absent, last = Absent, before = Absent, categorySlug = Absent, viewerCanAdmin = Absent, adminId = Absent, organizationId = Absent, allStates = Absent, slugs = Absent, primaryCategoryOnly = Absent, withFreeTrialsOnly = Absent }

        optionalArgs____ =
            [ Argument.optional "first" filledInOptionals____.first (Encode.int), Argument.optional "after" filledInOptionals____.after (Encode.string), Argument.optional "last" filledInOptionals____.last (Encode.int), Argument.optional "before" filledInOptionals____.before (Encode.string), Argument.optional "categorySlug" filledInOptionals____.categorySlug (Encode.string), Argument.optional "viewerCanAdmin" filledInOptionals____.viewerCanAdmin (Encode.bool), Argument.optional "adminId" filledInOptionals____.adminId ((GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapEncoder .codecId)), Argument.optional "organizationId" filledInOptionals____.organizationId ((GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapEncoder .codecId)), Argument.optional "allStates" filledInOptionals____.allStates (Encode.bool), Argument.optional "slugs" filledInOptionals____.slugs (Encode.string |> Encode.maybe |> Encode.list), Argument.optional "primaryCategoryOnly" filledInOptionals____.primaryCategoryOnly (Encode.bool), Argument.optional "withFreeTrialsOnly" filledInOptionals____.withFreeTrialsOnly (Encode.bool) ]
                |> List.filterMap Basics.identity
    in
      Object.selectionForCompositeField "marketplaceListings" optionalArgs____ (object____) (Basics.identity)


{-| Return information about the GitHub instance
-}
meta : SelectionSet decodesTo GithubNoFormat.Object.GitHubMetadata
 -> SelectionSet decodesTo RootQuery
meta object____ =
      Object.selectionForCompositeField "meta" [] (object____) (Basics.identity)


type alias NodeRequiredArguments = { id : GithubNoFormat.ScalarCodecs.Id }

{-| Fetches an object given its ID.

  - id - ID of the object.

-}
node : NodeRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Interface.Node
 -> SelectionSet (Maybe decodesTo) RootQuery
node requiredArgs____ object____ =
      Object.selectionForCompositeField "node" [ Argument.required "id" requiredArgs____.id ((GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapEncoder .codecId)) ] (object____) (Basics.identity >> Decode.nullable)


type alias NodesRequiredArguments = { ids : (List GithubNoFormat.ScalarCodecs.Id) }

{-| Lookup nodes by a list of IDs.

  - ids - The list of node IDs.

-}
nodes : NodesRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Interface.Node
 -> SelectionSet (List (Maybe decodesTo)) RootQuery
nodes requiredArgs____ object____ =
      Object.selectionForCompositeField "nodes" [ Argument.required "ids" requiredArgs____.ids ((GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapEncoder .codecId) |> Encode.list) ] (object____) (Basics.identity >> Decode.nullable >> Decode.list)


type alias OrganizationRequiredArguments = { login : String }

{-| Lookup a organization by login.

  - login - The organization's login.

-}
organization : OrganizationRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Object.Organization
 -> SelectionSet (Maybe decodesTo) RootQuery
organization requiredArgs____ object____ =
      Object.selectionForCompositeField "organization" [ Argument.required "login" requiredArgs____.login (Encode.string) ] (object____) (Basics.identity >> Decode.nullable)


type alias RateLimitOptionalArguments = { dryRun : OptionalArgument Bool }

{-| The client's rate limit information.

  - dryRun - If true, calculate the cost for the query without evaluating it

-}
rateLimit : (RateLimitOptionalArguments -> RateLimitOptionalArguments)
 -> SelectionSet decodesTo GithubNoFormat.Object.RateLimit
 -> SelectionSet (Maybe decodesTo) RootQuery
rateLimit fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { dryRun = Absent }

        optionalArgs____ =
            [ Argument.optional "dryRun" filledInOptionals____.dryRun (Encode.bool) ]
                |> List.filterMap Basics.identity
    in
      Object.selectionForCompositeField "rateLimit" optionalArgs____ (object____) (Basics.identity >> Decode.nullable)


{-| Hack to workaround https://github.com/facebook/relay/issues/112 re-exposing the root query object
-}
relay : SelectionSet decodesTo RootQuery
 -> SelectionSet decodesTo RootQuery
relay object____ =
      Object.selectionForCompositeField "relay" [] (object____) (Basics.identity)


type alias RepositoryRequiredArguments = { owner : String
 , name : String }

{-| Lookup a given repository by the owner and repository name.

  - owner - The login field of a user or organization
  - name - The name of the repository

-}
repository : RepositoryRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Object.Repository
 -> SelectionSet (Maybe decodesTo) RootQuery
repository requiredArgs____ object____ =
      Object.selectionForCompositeField "repository" [ Argument.required "owner" requiredArgs____.owner (Encode.string), Argument.required "name" requiredArgs____.name (Encode.string) ] (object____) (Basics.identity >> Decode.nullable)


type alias RepositoryOwnerRequiredArguments = { login : String }

{-| Lookup a repository owner (ie. either a User or an Organization) by login.

  - login - The username to lookup the owner by.

-}
repositoryOwner : RepositoryOwnerRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Interface.RepositoryOwner
 -> SelectionSet (Maybe decodesTo) RootQuery
repositoryOwner requiredArgs____ object____ =
      Object.selectionForCompositeField "repositoryOwner" [ Argument.required "login" requiredArgs____.login (Encode.string) ] (object____) (Basics.identity >> Decode.nullable)


type alias ResourceRequiredArguments = { url : GithubNoFormat.ScalarCodecs.Uri }

{-| Lookup resource by a URL.

  - url - The URL.

-}
resource : ResourceRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Interface.UniformResourceLocatable
 -> SelectionSet (Maybe decodesTo) RootQuery
resource requiredArgs____ object____ =
      Object.selectionForCompositeField "resource" [ Argument.required "url" requiredArgs____.url ((GithubNoFormat.ScalarCodecs.codecs |> GithubNoFormat.Scalar.unwrapEncoder .codecUri)) ] (object____) (Basics.identity >> Decode.nullable)


type alias SearchOptionalArguments = { first : OptionalArgument Int
 , after : OptionalArgument String
 , last : OptionalArgument Int
 , before : OptionalArgument String }

type alias SearchRequiredArguments = { query : String
 , type_ : GithubNoFormat.Enum.SearchType.SearchType }

{-| Perform a search across resources.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - query - The search string to look for.
  - type_ - The types of search items to search within.

-}
search : (SearchOptionalArguments -> SearchOptionalArguments)
 -> SearchRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Object.SearchResultItemConnection
 -> SelectionSet decodesTo RootQuery
search fillInOptionals____ requiredArgs____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs____ =
            [ Argument.optional "first" filledInOptionals____.first (Encode.int), Argument.optional "after" filledInOptionals____.after (Encode.string), Argument.optional "last" filledInOptionals____.last (Encode.int), Argument.optional "before" filledInOptionals____.before (Encode.string) ]
                |> List.filterMap Basics.identity
    in
      Object.selectionForCompositeField "search" (optionalArgs____ ++ [ Argument.required "query" requiredArgs____.query (Encode.string), Argument.required "type" requiredArgs____.type_ ((Encode.enum GithubNoFormat.Enum.SearchType.toString)) ]) (object____) (Basics.identity)


type alias TopicRequiredArguments = { name : String }

{-| Look up a topic by name.

  - name - The topic's name.

-}
topic : TopicRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Object.Topic
 -> SelectionSet (Maybe decodesTo) RootQuery
topic requiredArgs____ object____ =
      Object.selectionForCompositeField "topic" [ Argument.required "name" requiredArgs____.name (Encode.string) ] (object____) (Basics.identity >> Decode.nullable)


type alias UserRequiredArguments = { login : String }

{-| Lookup a user by login.

  - login - The user's login.

-}
user : UserRequiredArguments
 -> SelectionSet decodesTo GithubNoFormat.Object.User
 -> SelectionSet (Maybe decodesTo) RootQuery
user requiredArgs____ object____ =
      Object.selectionForCompositeField "user" [ Argument.required "login" requiredArgs____.login (Encode.string) ] (object____) (Basics.identity >> Decode.nullable)


{-| The currently authenticated user.
-}
viewer : SelectionSet decodesTo GithubNoFormat.Object.User
 -> SelectionSet decodesTo RootQuery
viewer object____ =
      Object.selectionForCompositeField "viewer" [] (object____) (Basics.identity)
