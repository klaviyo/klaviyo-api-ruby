# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [14.0.0] - revision 2025-07-15
### Added
#### Mapped Metrics API

- Use the [Mapped Metrics API](https://developers.klaviyo.com/en/reference/get_mapped_metrics) to retrieve some or all mapped metrics in your Klaviyo account, or [update](https://developers.klaviyo.com/en/reference/update_mapped_metric) a mapped metric.
- Get the [metric](https://developers.klaviyo.com/en/reference/get_metric_for_mapped_metric), [custom metric](https://developers.klaviyo.com/en/reference/get_custom_metric_for_mapped_metric), or associated metric IDs for a given mapped metric.

#### Custom Objects API

- Use the [Custom Objects API](https://developers.klaviyo.com/en/reference/custom_objects_api_overview) to ingest data records from other third-party sources into Klaviyo and retrieve all available data sources for an account.
- Use ingested data records to create [custom objects](https://help.klaviyo.com/hc/en-us/articles/35105337172123) in a Klaviyo account.

## [13.0.1] - revision 2025-04-15
### Fixed
- Fixed `ApiError` initialization so that it doesn't swallow errors
### Changed
- Removed API revision from comment on files

## [13.0.0] - revision 2025-04-15
### Added
#### Web Feeds API

- Create, retrieve, update, and/or delete web feeds via the [Web Feeds API](https://developers.klaviyo.com/en/reference/web_feeds_api_overview).
- Create universal content blocks referencing these web feeds with our [Universal Content API](https://developers.klaviyo.com/en/reference/universal_content_api_overview).

#### Custom Metrics API

- Create, retrieve, update, and/or delete custom metrics via the [Custom Metrics API](https://developers.klaviyo.com/en/reference/custom_metrics_api_overview).
- Report on custom metric conversions in our Campaign and Flow [Reporting APIs](https://developers.klaviyo.com/en/reference/reporting_api_overview) (set the custom metric ID as the `conversion_metric_id`).

> 🚧
>
> Standard accounts can only have 1 custom metric. Upgrade to Klaviyo's [Advanced KDP](https://www.klaviyo.com/products/advanced-cdp) or [Marketing Analytics](https://www.klaviyo.com/solutions/analytics) plan to create up to 50 custom metrics. To learn more about these plans, visit our [billing guide](https://help.klaviyo.com/hc/en-us/articles/115000976672).

#### Get and Delete Push Token APIs

- Retrieve and/or delete a given push token via [Get Push Token](https://developers.klaviyo.com/en/reference/get_push_token) and [Delete Push Token APIs](https://developers.klaviyo.com/en/reference/delete_push_token).
- [Include](https://developers.klaviyo.com/en/docs/relationships_#the-include-query-parameter) push tokens on `GET /api/profiles`.
- We've added relationship endpoints for both profiles and push tokens:
  - Retrieve push tokens associated with a profile (`GET /api/profiles/{ID}/push-tokens`).
  - Get IDs for push tokens associated with a profile (`GET /api/profiles/{ID}/relationships/push-tokens`).
  - Retrieve the profile associated with a push token (`GET /api/push-tokens/{ID}/profile`).
  - Get ID for the profile associated with a push token (`GET /api/push-tokens/{ID}/relationships/profile`).

### Changed
#### Campaigns API endpoints updated to support options for push notification badges

- Badge count settings are supported on the "campaign-message" resource for push messages.
  - The following options for incrementing badge count have been added to the Campaigns API: `increment_one` (increment by 1), `set_count` (increment by a given value), and `set_property` (increment by profile property).

#### Optional AMP MIME-type field for Templates API

- We've added support for creating and updating AMP versions of an email template through an optional `amp` field (under `attributes`) in our Create and Update Template APIs.
- This field requires AMP Email to be enabled. Refer to our [AMP Email setup guide](https://developers.klaviyo.com/en/docs/send_amp_emails_in_klaviyo) for more information.

## [12.0.0] - revision 2025-01-15
### Added
- Get and Update Reviews APIs
  - Retrieve all reviews with `Reviews.get_reviews` or return a review with a specified ID using the `Reviews.get_review` endpoint.
  - Manage your reviews programmatically with the `Reviews.update_review` endpoint, which allows you to change the status of a review, such as to reject or approve it. This endpoint modifies the moderation status of a review based on the provided review ID and status.
- Get and Create Flows APIs
  - Return a flow with the given flow ID using the `Flows.get_flow` endpoint.
  - Create a new flow with the `Flows.create_flow` endpoint.
- Campaigns API
  - Manage the images for your campaigns with a new set of endpoints for the `Campaigns` API, including: `get_image_for_campaign_message`, `get_image_id_for_campaign_message`, and `update_image_for_campaign_message`.
### Changed
- **Breaking:** Subscription endpoints required field
  - Calls to `Profiles.bulk_subscribe_profiles` and `Profiles.unsubscribe_profiles` now require the `subscriptions` field, which grants or revokes consent for the indicated message types on the specified channels, such as email or sms.
- **Breaking:** Campaigns API push notification support
  - The Campaigns API now supports the push notification channel.
  - Support for push notifications includes **significant changes** to the following endpoints: `get_campaigns`, `get_campaign`, `create_campaign`, `update_campaign`, `create_campaign_clone`, `get_messages_for_campaign`, `get_campaign_message`, `update_campaign_message`, `get_campaign_for_campaign_message`, `get_campaign_id_for_campaign_message`.
  - We recommend that you review the [Campaigns API Overview](https://developers.klaviyo.com/en/reference/campaigns_api_overview) for more detailed information about changes to the structure and responses of these endpoints.
- **Breaking:** Pagination updates
  - The `Flows.get_messages_for_flow_action` and `Flows.get_action_id_for_flow_message` endpoints have been updated from offset pagination to cursor pagination.
- Create Template API
  - The `Templates.create_template` endpoint now supports the creation of hybrid templates when `editor_type` is `USER_DRAGGABLE` and hybrid template HTML is included.
- Profiles API
  - The following server-side APIs have been updated to an enhanced identity resolution processor to better follow the Klaviyo identity resolution identifier priority order.
    - `Profiles.create_profile`
    - `Profiles.update_profile`

## [11.1.0] - revision 2024-10-15
### Added
- OAuth Support
  - Pass your OAuth access token to `config.access_token` to use OAuth authentication.

## [11.0.0] - revision 2024-10-15
### Changed
  - Improved Retry Logic
    - To address 429 status codes, we have modified the retry logic to use exponential backoff and the `Retry-After` header.
    - **Breaking:** Retry logic is now enabled by default. To disable it, set `config.max_retries` to `0`.

## [10.0.0] - 2024-10-15
### Added
- Universal Content API
  - Read, update, and delete universal content
  - For more information, see our [Universal Content API overview](https://developers.klaviyo.com/en/reference/universal_content_api_overview)
- Form Reporting API
  - Query form performance
  - For more information, see our [Reporting API overview](https://developers.klaviyo.com/en/reference/reporting_api_overview#forms)
- Segment Reporting API
  - Query segment growth data
  - For more information, see our [Reporting API overview](https://developers.klaviyo.com/en/reference/reporting_api_overview#segments)
- Reviews API
  - Get and list reviews
  - For more information, see our [Reviews API overview](https://developers.klaviyo.com/en/reference/reviews_api_overview)
- Tracking Settings API
  - Read and update the Tracking Settings for an account (Account -> Settings -> UTM Tracking in UI)
  - For more information, see our [Tracking Settings API documentation](https://developers.klaviyo.com/en/reference/get_tracking_settings)
- Metric Properties API
  - Access the properties for a given metric (e.g. "Placed Order")
  - For more information, see our [Metric Properties API documentation](https://developers.klaviyo.com/en/reference/get_metric_property)
- Suppress/Unsuppress profile job APIs
  - Monitor the status of jobs created by Suppress Profiles and Unsuppress Profiles requests
  - For more information, see our [Suppress Profiles Job API documentation](https://developers.klaviyo.com/en/reference/get_bulk_suppress_profiles_job)

### Changed
- `Profiles.create_or_update_profile` has been updated to an enhanced identity resolution processor to better follow the Klaviyo identity resolution identifier priority order
- Added support for `$locale` property for `Profiles`
- Numerous methods have been renamed as part of a large renaming effort - the old methods are now deprecated aliases

## [9.0.0] - revision 2024-07-15
### Added
- Added several method aliases based on previous operation IDs

## [8.0.0] - revision 2024-07-15

### Added

 - Forms API
  - New `KlaviyoAPI::Forms` class with methods to get forms, form versions and relationships.
 - Webhooks API
  - new `KlaviyoAPI::Webooks` class containing CRUD operations for webhooks.

### Changed
 - `ProfilesApi.subscribe()`
  - Added `historical_import` flag for importing historically consented profiles can now be optionally supplied in the payload for the Subscribe Profiles endpoint.
  - When using this flag, a consented_at date must be provided and must be in the past.


## [7.1.0] - revision 2024-06-15

### Added
  - Segments Api
    - New create segment endpoint `KlaviyoAPI::Segments.create_segment()`.
    - New delete segment endpoint `KlaviyoAPI::Segments.delete_segment()`.
    - Updated exisiting segments endpoints to include the segment definition
    - For more information, see our [Segments API overview](https://developers.klaviyo.com/en/reference/segments_api_overview).

  - Flows Api
    - New delete flows endpoint `KlaviyoAPI::Flows.delete_flow()`


## [7.0.0] - revision 2024-05-15

### Added

  - Bulk Create Events API 
    - We have added support for creating events in bulk via the `KlaviyoAPI::Event.bulk_create_events` method
  - Create multiple events for new and existing profiles and/or update profile properties in a single API call. For more information, see our [Events API overview](https://developers.klaviyo.com/en/reference/events_api_overview).

### Changed

  - Accounts Api
    - `KlaviyoAPI::Accounts.get_accounts` and `KlaviyoAPI::Accounts.get_account` have been updated to return the account's locale, e.g. `en-US`.

  - **Breaking** Subscribe API Synchronous Validation Improved
    - To provide better feedback for handling SMS subscriptions, we’ve added improved validation behavior to `KlaviyoAPI::Profiles.subscribe_profiles` method. In prior revisions, such requests may appear as 202s but will fail to update SMS consent. To handle this issue, 400 validation errors are returned for the following cases
      1. If a profile is subscribed to SMS marketing and [age-gating is enabled](https://help.klaviyo.com/hc/en-us/articles/4408311712667) but age_gated_date_of_birth is not provided, or the DOB does not meet the region's requirements.
      2. If the account does not have a sending number in the phone number’s region.
      3. If the phone number is in a region not supported by Klaviyo.
      4. If consented_at is set and the list or global setting is double opt-in.
  - Use `KLAVIYO_API_REVISION` as the env var for controlling which Klaviyo API to call, instead of `API_REVISION`.  However, `API_REVISION` is a fallback, to avoid making this a breaking change


## [6.0.0] - revision 2024-02-15

### Added: 

- New `Reporting` allows you to request campaign and flow performance data that you can view in the Klaviyo UI.

- `campaign_values_query`
  - Request campaign analytics data, for example, a campaign performance report on the open rate over the past 30 days.

- `flow_values_query`
  - Request flow analytics data, for example, a flow performance report on the revenue per recipient value over the past 3 months.

- `flow_series_query`
  - Fetch flow series data for a specific interval and timeframe, for example, a flow performance report on weekly click rates  over the past 12 months.


- New `Profiles` endpoint allows you to create or update a profile with a set of profile attributes.

  - `create_or_update_profile`
    - This endpoint operates synchronously and offers an upsert pattern similar to the [v1/v2 Identify API](https://developers.klaviyo.com/en/docs/apis_comparison_chart).

### Changed:
	
- Removed the $attribution field from event_properties in get_event and  get_events (breaking change).
	
  - To include this data in your request, add include=attributions to your request.


## [5.1.0] - revision 2023-12-15
### Added
- New Endpoints: Bulk Profile Imports:
    - `Profiles.spawn_bulk_profile_import_job`
    - `Profiles.get_bulk_profile_import_job`
    - `Profiles.get_bulk_profile_import_jobs`
    - `Profiles.get_bulk_profile_import_job_lists`
    - `Profiles.get_bulk_profile_import_job_profiles`
    - `Profiles.get_bulk_profile_import_job_import_errors`
    - `Profiles.get_bulk_profile_import_job_relationships_profiles`
    - `Profiles.get_bulk_profile_import_job_relationships_lists`
### Changed
- The `relationships` field of Profiles.subscribe_profiles payload is now optional. (see [subscribe_profiles reference](https://developers.klaviyo.com/en/reference/subscribe_profiles) for details).

## [5.0.0] - revision 2023-10-15

### Added

- Support for returning list suppressions via the [/profiles endpoint](https://developers.klaviyo.com/en/reference/get_profiles)

  Rules for suppression [filtering](https://developers.klaviyo.com/en/docs/filtering_):  

    - You may not mix-and-match list and global filters  
    - You may only specify a single date filter  
    - You may or may not specify a reason  
    - You must specify a list_id to filter on any list suppression properties

  Examples:

  - To return profiles who were suppressed after a certain date:  
    `{filter: "greater-than(subscriptions.email.marketing.suppression.timestamp,2023-03-01T01:00:00Z)`
  - To return profiles who were suppressed from a specific list after a certain date:  
    `{filter: "greater-than(subscriptions.email.marketing.list_suppressions.timestamp,2023-03-01T01:00:00Z),equals(subscriptions.email.marketing.list_suppressions.list_id,\"LIST_ID\"")`
  - To return all profiles who were suppressed for a specific reason after a certain date:  
    `{"filter: 'greater-than(subscriptions.email.marketing.suppression.timestamp,2023-03-01T01:00:00Z),equals(subscriptions.email.marketing.suppression.reason\"user_suppressed\"")`

- Optionally retrieve subscription status on Get List Profiles, Get Segment Profiles, Get Event Profile

  -  Use `{additional_fields_profile = ["subscriptions"]}` on these endpoints to include subscription information.

## Changes

- Subscription object not returned by default on Get Profile / Get Profiles

  -  The subscription object is no longer returned by default with get profile(s) requests. However, it can be included by adding  `{additional_fields_profile = ["subscriptions"]}s` to the request. This change will allow us to  provide a more performant experience when making requests to Get Profiles without including the subscriptions object.

 -  Profile Subscription Fields Renamed

  - In the interest of providing more clarity and information on the subscription object, we have renamed several fields, and added several as well. This will provide more context on a contact's subscriptions and consent, as well as boolean fields to see who you can or cannot message.
    
  For SMSMarketing:

  - `timestamp` is now `consent_timestamp`
  - `last_updated` is a new field that mirrors `consent_timestamp`
  - `can_receive_sms_marketing` is a new field which is `True` if the profile is consented for SMS 

  For EmailMarketing:

  - `timestamp` is now `consent_timestamp`
  - `can_receive_email_marketing` is True if the profile does not have a global suppression
  - `suppressions` is now `suppression`
  - `last_updated` is a new field that is the most recent of all the dates on the object

## [4.2.0] - revision 2023-09-15
### Added

- `Images` API
  - We now support the following operations to work with images:
    - `get_image`
    - `get_images`
    - `update_image`
    - `upload_image_from_file`
    - `upload_image_from_url`
- `Coupons` API
  - We now support CRUD operations for both Coupons and Coupon Codes
  - Check out [Coupons API guide](https://developers.klaviyo.com/en/docs/use_klaviyos_coupons_api) for more information.
- Additional filtering/sorting option for Lists and Segments: `joined_group_at`
- New profile merge endpoint: `Profiles.merge_profiles`
- Increased the maximum page size limit for List and Segment Profile Relationship Endpoints to 1000

## [4.1.0] - revision 2023-08-15
### Added
- Flow Message Templates
- You can now retrieve the templates associated with flow messages using `Flows.get_flow_message_template()` or `Flows.get_flow_message_relationships_template()` . You’re also able to include the template HTML for a flow message using `Flows.get_flow_message(id, {"include": ["template"]})`.
- Create or Update Push Tokens
- We have added an endpoint to create push tokens, `Profiles.create_push_token()`. This endpoint can be used to migrate profiles and their push tokens from another platform to Klaviyo. If you’re looking to register push tokens from users’ devices, please use our mobile SDKs.

## [4.0.0] - revision 2023-07-15
### Added
- Back-In-stock APIs
  - We have added support for subscribing profiles to back-in-stock notifications, for both email and SMS, using the new [create_back_in_stock_subscription](./README.md#create-back-in-stock-subscription) endpoint.  
- New functionality to Campaigns API
  - CRUD support for SMS campaigns is now available
  - You can now also retrieve all messages for a campaign to determine performance data on campaigns where you're running A/B tests
    - To support this functionality, we introduced a relationship between [campaigns and campaign messages](./README.md#get-campaign-relationships-campaign-messages), and between [campaign messages and templates](./README.md#get-campaign-message-relationships-template)


### Changed
- Relationship Standardization
  - We are making a number of changes across endpoints to standardize how we handle [relationships](https://developers.klaviyo.com/en/docs/relationships_) in our APIs and leverage consistently typed objects across endpoints. For example, you can create a profile in our APIs in the same shape, regardless of whether you're calling the profiles endpoint or the events endpoint.
  - The changes include:
    - Updating 1:1 relationships to use singular tense and an object (instead of plural and an array) 
      - example: for [get_flow_action](./README.md#get-flow-action), if you want to use the `include` param, you would set `include=` to `"flow"` (instead of `"flows"`)
    - Moving related object IDs from the attributes payload to relationships
      - example: The format for the [body](https://developers.klaviyo.com/en/reference/create_tag) of [create_tag](./README.md#create-tag) has changed, with `tag_group_id` previously at `data.attributes.tag_group_id` being removed and replaced by a `data` object containing `type`+`id` and located at `data.relationships.tag-group.data`.
    - Specifying a relationship between two Klaviyo objects to allow for improved consistency and greater interoperability across endpoints 
      - example: for [create_event](./README.md#create-event), you can now create/update a profile for an event in the same way you would when using the profiles API directly
  - NOTE: The examples for the above relationship changes are illustrative, not comprehensive. For a complete list of ALL the endpoints that have changed and exactly how, please refer to our latest [API Changelog](https://developers.klaviyo.com/en/docs/changelog_#revision-2023-07-15)
- For [get_campaigns](./README.md#get-campaigns) endpoint, `filter` param is now required, to, at minimum, filter on `messages.channel`


### Removed
- We removed the `company_id` from the response for [get_template](./README.md#get-template) and [get_templates](./README.md#get-templates). If you need to obtain the company ID / public API key for an account, please use the [Accounts API](./README.md#accounts).- We removed the `company_id` from the response for [get_template](./README.md#get-template) and [get_templates](./README.md#get-templates). If you need to obtain the company ID / public API key for an account, please use the [Accounts API](./README.md#accounts).

## [3.0.0] - revision 2023-06-15
### Added
- Accounts API is now available, this will allow you to access information about the Klaviyo account associated with your API key.
  - `get_accounts`
  - `get_account`
  
**Note:** You will need to generate a new API key with either the `Accounts` scope enabled or `Full Access` to use these endpoints.

### Removed
- All `client` endpoints
  - `create_client_event`
  - `create_client_profile`
  - `create_client_subscription`
## [2.0.0] - 2023-04-06
### Added
- Profiles API now returns predictive analytics when calling `get_profile` and `get_profiles` by passing in `additional_fields_profile: ["predictive_analytics"]`.

### Changed
- Relationship endpoints that were previously grouped together are now split into related-resource-specific endpoints.

### Migration Guide
- To migrate to this latest version, all calls to relationship endpoints need to be updated, as in the following example:
  - `get_campaign_relationships(id, "tags")` will become `get_campaign_relationships_tags(id)`.
## [1.2.0] - 2023-02-22
### Added
- Campagins (which were previously in our Beta API/SDKs)

### Changes
- Profiles
    - Fix longitude value in ProfileLocation type mapping
- Flows
    - Pagination changed from page offset to cursor

## [1.1.0] - 2022-01-24
### Added
- Added the following endpoints (which were previously in our Beta API/SDKs):
    - Data Privacy
    - All Tags endpoints, as well as the following related resource-specific endpoints:
      - Get Flow Tags
      - Get List Tags
      - Get Segment Tags

## [1.0.1] - 2022-12-06
### Changes
- Support for cursor pagination
    - Passing the `next` value from a paginated result to the following call via the `page_cursor` query string argument will now result in the cursor being parsed and set appropriately by the `ApiClient`.

## [1.0.0] - 2022-10-19
### Added
- Initial release

### Changes
- Naming changes:
    - Package name: klaviyo_sdk -> klaviyo-api-sdk
    - Module name: KlaviyoBeta -> KlaviyoAPI
    - Some functions have changed name
- New resources and endpoints: 
    - See API Changelog for full details
