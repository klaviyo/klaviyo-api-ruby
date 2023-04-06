# Klaviyo Ruby SDK

- SDK version: 2.0.0
- API revision: 2023-02-22

## Helpful Resources

- [API Reference](https://developers.klaviyo.com/en/v2023-02-22/reference)
- [API Guides](https://developers.klaviyo.com/en/v2023-02-22/docs)
- [Postman Workspace](https://www.postman.com/klaviyo/workspace/klaviyo-developers)

## Design & Approach

This SDK is a thin wrapper around our API. See our API Reference for full documentation on API behavior.

## Organization

This SDK is organized into the following resources:



- Campaigns



- Catalogs



- Client



- Data Privacy



- Events



- Flows



- Lists



- Metrics



- Profiles



- Segments



- Tags



- Templates




# Installation


## Build

To build the Ruby code into a gem:

```shell
gem build klaviyo-api-sdk.gemspec
```

Then install the gem locally:

```shell
gem install ./klaviyo-api-sdk-2.0.0.gem
```


Finally add this to the Gemfile:

    gem 'klaviyo-api-sdk', '~> 2.0.0'

To install directly from rubygems:

```shell
gem install klaviyo-api-sdk
```

# Usage Example

### To load the gem

```ruby
# Load the gem
require 'klaviyo-api-sdk'

# Setup authorization
KlaviyoAPI.configure do |config|
  config.api_key['Klaviyo-API-Key'] = 'Klaviyo-API-Key your-api-key'
  #config.max_retries = 5 # optional
  #config.max_delay = 60 # optional
end
```

NOTE: 
* The SDK retries on resolvable errors, namely: rate limits (common) and server errors on klaviyo (rare).
* `max_retry` denotes number of attempts the client will make in order to execute the request successfully.
* `max_delay` denotes total delay (in seconds) across all attempts.

### To call the `get_catalog_items` operation:

```ruby
opts = {
  include: ['variants'],
  sort: 'created',
  filter: 'equals(published,false)',
  fields_catalog_item: ['external_id','title']
}

begin
  result = KlaviyoAPI::Catalogs.get_catalog_items(opts)
end
```

# Error Handling

This SDK throws an `ApiException` error when the server returns a non-`2XX` response. 
```ruby
begin
  result = KlaviyoAPI::Catalogs.get_catalog_items(opts)
rescue KlaviyoAPI::ApiError => e
  puts "Error when calling get_catalog_items #{e}"
end
```

# Comprehensive list of Operations & Parameters

_**NOTE:**_
- Organization: Resource groups and operation_ids are listed in alphabetical order, first by Resource name, then by **OpenAPI Summary**. Operation summaries are those listed in the right side bar of the [API Reference](https://developers.klaviyo.com/en/v2023-02-22/reference/get_events).
- For example values / data types, as well as whether parameters are required/optional, please reference the corresponding API Reference link.
- Some args are required for the API call to succeed, the API docs above are the source of truth regarding which params are required.

## Method signatures
- `get` operations can be passed an optional `opts` object (e.g. `get_list_profiles(opts)`).
`opts` describes the available options for fetching data (some operations only support a subset of these or none).
i.e.
```ruby
opts = {
  include: ['variants'], # includes
  sort: '-created', # sorting
  filter: 'equals(published,false)', # filters
  page_cursor: 'page_cursor_example', # cursor pagination
  fields_catalog_item: ['external_id','title'], # sparse fieldset
  fields_catalog_variant: ['external_id','title'], # sparse fieldset
  additional_fields_profile: ['predictive_analytics'], # for endpoints that support predictive analytics such as `get_profile`
}
```
**Note, for parameters that use square brackets such as `page[cursor]` or `fields[catalog-item]` ruby will replace the square brackets `[]` with `_` underscores.

- For `create`, `update` & some `delete` operations (i.e. `create_catalog_item` or `update_catalog_item` or `delete_catalog_category_relationships`)
the `body` object is required in the method signature (i.e. `create_catalog_item(body)`).
```ruby
body = {
  data: {
    type: "catalog-item",
    attributes: {
      external_id: "catalog-item-test",
      title: "Catalog Item Test",
      description: "this is a description",
      url: "http://catalog-item.klaviyo.com",
      published: true
    }
  }
}
KlaviyoAPI::Catalogs.create_catalog_item(body)
```





## Campaigns


#### [Create Campaign](https://developers.klaviyo.com/en/v2023-02-22/reference/create_campaign)

```ruby
KlaviyoAPI::Campaigns.create_campaign(body)
```





#### [Create Campaign Clone](https://developers.klaviyo.com/en/v2023-02-22/reference/create_campaign_clone)

```ruby
KlaviyoAPI::Campaigns.create_campaign_clone(body)
```





#### [Assign Campaign Message Template](https://developers.klaviyo.com/en/v2023-02-22/reference/create_campaign_message_assign_template)

```ruby
KlaviyoAPI::Campaigns.create_campaign_message_assign_template(body)
```





#### [Create Campaign Recipient Estimation Job](https://developers.klaviyo.com/en/v2023-02-22/reference/create_campaign_recipient_estimation_job)

```ruby
KlaviyoAPI::Campaigns.create_campaign_recipient_estimation_job(body)
```





#### [Create Campaign Send Job](https://developers.klaviyo.com/en/v2023-02-22/reference/create_campaign_send_job)

```ruby
KlaviyoAPI::Campaigns.create_campaign_send_job(body)
```





#### [Delete Campaign](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_campaign)

```ruby
KlaviyoAPI::Campaigns.delete_campaign(id)
```





#### [Get Campaign](https://developers.klaviyo.com/en/v2023-02-22/reference/get_campaign)

```ruby
KlaviyoAPI::Campaigns.get_campaign(id, opts)
```





#### [Get Campaign Message](https://developers.klaviyo.com/en/v2023-02-22/reference/get_campaign_message)

```ruby
KlaviyoAPI::Campaigns.get_campaign_message(id, opts)
```





#### [Get Campaign Recipient Estimation](https://developers.klaviyo.com/en/v2023-02-22/reference/get_campaign_recipient_estimation)

```ruby
KlaviyoAPI::Campaigns.get_campaign_recipient_estimation(id, opts)
```





#### [Get Campaign Recipient Estimation Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_campaign_recipient_estimation_job)

```ruby
KlaviyoAPI::Campaigns.get_campaign_recipient_estimation_job(id, opts)
```





#### [Get Campaign Relationships Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_campaign_relationships_tags)

```ruby
KlaviyoAPI::Campaigns.get_campaign_relationships_tags(id)
```





#### [Get Campaign Send Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_campaign_send_job)

```ruby
KlaviyoAPI::Campaigns.get_campaign_send_job(id, opts)
```





#### [Get Campaign Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_campaign_tags)

```ruby
KlaviyoAPI::Campaigns.get_campaign_tags(campaign_id, opts)
```





#### [Get Campaigns](https://developers.klaviyo.com/en/v2023-02-22/reference/get_campaigns)

```ruby
KlaviyoAPI::Campaigns.get_campaigns(opts)
```





#### [Update Campaign](https://developers.klaviyo.com/en/v2023-02-22/reference/update_campaign)

```ruby
KlaviyoAPI::Campaigns.update_campaign(id, body)
```





#### [Update Campaign Message](https://developers.klaviyo.com/en/v2023-02-22/reference/update_campaign_message)

```ruby
KlaviyoAPI::Campaigns.update_campaign_message(id, body)
```





#### [Update Campaign Send Job](https://developers.klaviyo.com/en/v2023-02-22/reference/update_campaign_send_job)

```ruby
KlaviyoAPI::Campaigns.update_campaign_send_job(id, body)
```






## Catalogs


#### [Create Catalog Category](https://developers.klaviyo.com/en/v2023-02-22/reference/create_catalog_category)

```ruby
KlaviyoAPI::Catalogs.create_catalog_category(body)
```





#### [Create Catalog Category Relationships Items](https://developers.klaviyo.com/en/v2023-02-22/reference/create_catalog_category_relationships_items)

```ruby
KlaviyoAPI::Catalogs.create_catalog_category_relationships_items(id, body)
```





#### [Create Catalog Item](https://developers.klaviyo.com/en/v2023-02-22/reference/create_catalog_item)

```ruby
KlaviyoAPI::Catalogs.create_catalog_item(body)
```





#### [Create Catalog Item Relationships Categories](https://developers.klaviyo.com/en/v2023-02-22/reference/create_catalog_item_relationships_categories)

```ruby
KlaviyoAPI::Catalogs.create_catalog_item_relationships_categories(id, body)
```





#### [Create Catalog Variant](https://developers.klaviyo.com/en/v2023-02-22/reference/create_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.create_catalog_variant(body)
```





#### [Delete Catalog Category](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_catalog_category)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_category(id)
```





#### [Delete Catalog Category Relationships Items](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_catalog_category_relationships_items)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_category_relationships_items(id, body)
```





#### [Delete Catalog Item](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_catalog_item)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_item(id)
```





#### [Delete Catalog Item Relationships Categories](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_catalog_item_relationships_categories)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_item_relationships_categories(id, body)
```





#### [Delete Catalog Variant](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_variant(id)
```





#### [Get Catalog Categories](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_categories)

```ruby
KlaviyoAPI::Catalogs.get_catalog_categories(opts)
```





#### [Get Catalog Category](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_category)

```ruby
KlaviyoAPI::Catalogs.get_catalog_category(id, opts)
```





#### [Get Catalog Category Items](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_category_items)

```ruby
KlaviyoAPI::Catalogs.get_catalog_category_items(category_id, opts)
```





#### [Get Catalog Category Relationships Items](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_category_relationships_items)

```ruby
KlaviyoAPI::Catalogs.get_catalog_category_relationships_items(id, opts)
```





#### [Get Catalog Item](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_item)

```ruby
KlaviyoAPI::Catalogs.get_catalog_item(id, opts)
```





#### [Get Catalog Item Categories](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_item_categories)

```ruby
KlaviyoAPI::Catalogs.get_catalog_item_categories(item_id, opts)
```





#### [Get Catalog Item Relationships Categories](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_item_relationships_categories)

```ruby
KlaviyoAPI::Catalogs.get_catalog_item_relationships_categories(id, opts)
```





#### [Get Catalog Item Variants](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_item_variants)

```ruby
KlaviyoAPI::Catalogs.get_catalog_item_variants(item_id, opts)
```





#### [Get Catalog Items](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_items)

```ruby
KlaviyoAPI::Catalogs.get_catalog_items(opts)
```





#### [Get Catalog Variant](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.get_catalog_variant(id, opts)
```





#### [Get Catalog Variants](https://developers.klaviyo.com/en/v2023-02-22/reference/get_catalog_variants)

```ruby
KlaviyoAPI::Catalogs.get_catalog_variants(opts)
```





#### [Get Create Categories Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_create_categories_job)

```ruby
KlaviyoAPI::Catalogs.get_create_categories_job(job_id, opts)
```





#### [Get Create Categories Jobs](https://developers.klaviyo.com/en/v2023-02-22/reference/get_create_categories_jobs)

```ruby
KlaviyoAPI::Catalogs.get_create_categories_jobs(opts)
```





#### [Get Create Items Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_create_items_job)

```ruby
KlaviyoAPI::Catalogs.get_create_items_job(job_id, opts)
```





#### [Get Create Items Jobs](https://developers.klaviyo.com/en/v2023-02-22/reference/get_create_items_jobs)

```ruby
KlaviyoAPI::Catalogs.get_create_items_jobs(opts)
```





#### [Get Create Variants Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_create_variants_job)

```ruby
KlaviyoAPI::Catalogs.get_create_variants_job(job_id, opts)
```





#### [Get Create Variants Jobs](https://developers.klaviyo.com/en/v2023-02-22/reference/get_create_variants_jobs)

```ruby
KlaviyoAPI::Catalogs.get_create_variants_jobs(opts)
```





#### [Get Delete Categories Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_delete_categories_job)

```ruby
KlaviyoAPI::Catalogs.get_delete_categories_job(job_id, opts)
```





#### [Get Delete Categories Jobs](https://developers.klaviyo.com/en/v2023-02-22/reference/get_delete_categories_jobs)

```ruby
KlaviyoAPI::Catalogs.get_delete_categories_jobs(opts)
```





#### [Get Delete Items Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_delete_items_job)

```ruby
KlaviyoAPI::Catalogs.get_delete_items_job(job_id, opts)
```





#### [Get Delete Items Jobs](https://developers.klaviyo.com/en/v2023-02-22/reference/get_delete_items_jobs)

```ruby
KlaviyoAPI::Catalogs.get_delete_items_jobs(opts)
```





#### [Get Delete Variants Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_delete_variants_job)

```ruby
KlaviyoAPI::Catalogs.get_delete_variants_job(job_id, opts)
```





#### [Get Delete Variants Jobs](https://developers.klaviyo.com/en/v2023-02-22/reference/get_delete_variants_jobs)

```ruby
KlaviyoAPI::Catalogs.get_delete_variants_jobs(opts)
```





#### [Get Update Categories Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_update_categories_job)

```ruby
KlaviyoAPI::Catalogs.get_update_categories_job(job_id, opts)
```





#### [Get Update Categories Jobs](https://developers.klaviyo.com/en/v2023-02-22/reference/get_update_categories_jobs)

```ruby
KlaviyoAPI::Catalogs.get_update_categories_jobs(opts)
```





#### [Get Update Items Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_update_items_job)

```ruby
KlaviyoAPI::Catalogs.get_update_items_job(job_id, opts)
```





#### [Get Update Items Jobs](https://developers.klaviyo.com/en/v2023-02-22/reference/get_update_items_jobs)

```ruby
KlaviyoAPI::Catalogs.get_update_items_jobs(opts)
```





#### [Get Update Variants Job](https://developers.klaviyo.com/en/v2023-02-22/reference/get_update_variants_job)

```ruby
KlaviyoAPI::Catalogs.get_update_variants_job(job_id, opts)
```





#### [Get Update Variants Jobs](https://developers.klaviyo.com/en/v2023-02-22/reference/get_update_variants_jobs)

```ruby
KlaviyoAPI::Catalogs.get_update_variants_jobs(opts)
```





#### [Spawn Create Categories Job](https://developers.klaviyo.com/en/v2023-02-22/reference/spawn_create_categories_job)

```ruby
KlaviyoAPI::Catalogs.spawn_create_categories_job(body)
```





#### [Spawn Create Items Job](https://developers.klaviyo.com/en/v2023-02-22/reference/spawn_create_items_job)

```ruby
KlaviyoAPI::Catalogs.spawn_create_items_job(body)
```





#### [Spawn Create Variants Job](https://developers.klaviyo.com/en/v2023-02-22/reference/spawn_create_variants_job)

```ruby
KlaviyoAPI::Catalogs.spawn_create_variants_job(body)
```





#### [Spawn Delete Categories Job](https://developers.klaviyo.com/en/v2023-02-22/reference/spawn_delete_categories_job)

```ruby
KlaviyoAPI::Catalogs.spawn_delete_categories_job(body)
```





#### [Spawn Delete Items Job](https://developers.klaviyo.com/en/v2023-02-22/reference/spawn_delete_items_job)

```ruby
KlaviyoAPI::Catalogs.spawn_delete_items_job(body)
```





#### [Spawn Delete Variants Job](https://developers.klaviyo.com/en/v2023-02-22/reference/spawn_delete_variants_job)

```ruby
KlaviyoAPI::Catalogs.spawn_delete_variants_job(body)
```





#### [Spawn Update Categories Job](https://developers.klaviyo.com/en/v2023-02-22/reference/spawn_update_categories_job)

```ruby
KlaviyoAPI::Catalogs.spawn_update_categories_job(body)
```





#### [Spawn Update Items Job](https://developers.klaviyo.com/en/v2023-02-22/reference/spawn_update_items_job)

```ruby
KlaviyoAPI::Catalogs.spawn_update_items_job(body)
```





#### [Spawn Update Variants Job](https://developers.klaviyo.com/en/v2023-02-22/reference/spawn_update_variants_job)

```ruby
KlaviyoAPI::Catalogs.spawn_update_variants_job(body)
```





#### [Update Catalog Category](https://developers.klaviyo.com/en/v2023-02-22/reference/update_catalog_category)

```ruby
KlaviyoAPI::Catalogs.update_catalog_category(id, body)
```





#### [Update Catalog Category Relationships Items](https://developers.klaviyo.com/en/v2023-02-22/reference/update_catalog_category_relationships_items)

```ruby
KlaviyoAPI::Catalogs.update_catalog_category_relationships_items(id, body)
```





#### [Update Catalog Item](https://developers.klaviyo.com/en/v2023-02-22/reference/update_catalog_item)

```ruby
KlaviyoAPI::Catalogs.update_catalog_item(id, body)
```





#### [Update Catalog Item Relationships Categories](https://developers.klaviyo.com/en/v2023-02-22/reference/update_catalog_item_relationships_categories)

```ruby
KlaviyoAPI::Catalogs.update_catalog_item_relationships_categories(id, body)
```





#### [Update Catalog Variant](https://developers.klaviyo.com/en/v2023-02-22/reference/update_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.update_catalog_variant(id, body)
```






## Client


#### [Create Client Event](https://developers.klaviyo.com/en/v2023-02-22/reference/create_client_event)

```ruby
KlaviyoAPI::Client.create_client_event(company_id, body)
```





#### [Create or Update Client Profile](https://developers.klaviyo.com/en/v2023-02-22/reference/create_client_profile)

```ruby
KlaviyoAPI::Client.create_client_profile(company_id, body)
```





#### [Create Client Subscription](https://developers.klaviyo.com/en/v2023-02-22/reference/create_client_subscription)

```ruby
KlaviyoAPI::Client.create_client_subscription(company_id, body)
```






## Data Privacy


#### [Request Profile Deletion](https://developers.klaviyo.com/en/v2023-02-22/reference/request_profile_deletion)

```ruby
KlaviyoAPI::DataPrivacy.request_profile_deletion(body)
```






## Events


#### [Create Event](https://developers.klaviyo.com/en/v2023-02-22/reference/create_event)

```ruby
KlaviyoAPI::Events.create_event(body)
```





#### [Get Event](https://developers.klaviyo.com/en/v2023-02-22/reference/get_event)

```ruby
KlaviyoAPI::Events.get_event(id, opts)
```





#### [Get Event Metrics](https://developers.klaviyo.com/en/v2023-02-22/reference/get_event_metrics)

```ruby
KlaviyoAPI::Events.get_event_metrics(id, opts)
```





#### [Get Event Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/get_event_profiles)

```ruby
KlaviyoAPI::Events.get_event_profiles(id, opts)
```





#### [Get Event Relationships Metrics](https://developers.klaviyo.com/en/v2023-02-22/reference/get_event_relationships_metrics)

```ruby
KlaviyoAPI::Events.get_event_relationships_metrics(id)
```





#### [Get Event Relationships Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/get_event_relationships_profiles)

```ruby
KlaviyoAPI::Events.get_event_relationships_profiles(id)
```





#### [Get Events](https://developers.klaviyo.com/en/v2023-02-22/reference/get_events)

```ruby
KlaviyoAPI::Events.get_events(opts)
```






## Flows


#### [Get Flow](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow)

```ruby
KlaviyoAPI::Flows.get_flow(id, opts)
```





#### [Get Flow Action](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_action)

```ruby
KlaviyoAPI::Flows.get_flow_action(id, opts)
```





#### [Get Flow For Flow Action](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_action_flow)

```ruby
KlaviyoAPI::Flows.get_flow_action_flow(action_id, opts)
```





#### [Get Messages For Flow Action](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_action_messages)

```ruby
KlaviyoAPI::Flows.get_flow_action_messages(action_id, opts)
```





#### [Get Flow Action Relationships Flow](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_action_relationships_flow)

```ruby
KlaviyoAPI::Flows.get_flow_action_relationships_flow(id)
```





#### [Get Flow Action Relationships Messages](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_action_relationships_messages)

```ruby
KlaviyoAPI::Flows.get_flow_action_relationships_messages(id, opts)
```





#### [Get Flow Actions For Flow](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_flow_actions)

```ruby
KlaviyoAPI::Flows.get_flow_flow_actions(flow_id, opts)
```





#### [Get Flow Message](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_message)

```ruby
KlaviyoAPI::Flows.get_flow_message(id, opts)
```





#### [Get Flow Action For Message](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_message_action)

```ruby
KlaviyoAPI::Flows.get_flow_message_action(message_id, opts)
```





#### [Get Flow Message Relationships Action](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_message_relationships_action)

```ruby
KlaviyoAPI::Flows.get_flow_message_relationships_action(id)
```





#### [Get Flow Relationships Flow Actions](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_relationships_flow_actions)

```ruby
KlaviyoAPI::Flows.get_flow_relationships_flow_actions(id, opts)
```





#### [Get Flow Relationships Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_relationships_tags)

```ruby
KlaviyoAPI::Flows.get_flow_relationships_tags(id)
```





#### [Get Flow Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flow_tags)

```ruby
KlaviyoAPI::Flows.get_flow_tags(flow_id, opts)
```





#### [Get Flows](https://developers.klaviyo.com/en/v2023-02-22/reference/get_flows)

```ruby
KlaviyoAPI::Flows.get_flows(opts)
```





#### [Update Flow Status](https://developers.klaviyo.com/en/v2023-02-22/reference/update_flow)

```ruby
KlaviyoAPI::Flows.update_flow(id, body)
```






## Lists


#### [Create List](https://developers.klaviyo.com/en/v2023-02-22/reference/create_list)

```ruby
KlaviyoAPI::Lists.create_list(body)
```





#### [Add Profile To List](https://developers.klaviyo.com/en/v2023-02-22/reference/create_list_relationships)

```ruby
KlaviyoAPI::Lists.create_list_relationships(id, body)
```





#### [Delete List](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_list)

```ruby
KlaviyoAPI::Lists.delete_list(id)
```





#### [Remove Profile From List](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_list_relationships)

```ruby
KlaviyoAPI::Lists.delete_list_relationships(id, body)
```





#### [Get List](https://developers.klaviyo.com/en/v2023-02-22/reference/get_list)

```ruby
KlaviyoAPI::Lists.get_list(id, opts)
```





#### [Get List Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/get_list_profiles)

```ruby
KlaviyoAPI::Lists.get_list_profiles(list_id, opts)
```





#### [Get List Relationships Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/get_list_relationships_profiles)

```ruby
KlaviyoAPI::Lists.get_list_relationships_profiles(id, opts)
```





#### [Get List Relationships Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_list_relationships_tags)

```ruby
KlaviyoAPI::Lists.get_list_relationships_tags(id)
```





#### [Get List Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_list_tags)

```ruby
KlaviyoAPI::Lists.get_list_tags(list_id, opts)
```





#### [Get Lists](https://developers.klaviyo.com/en/v2023-02-22/reference/get_lists)

```ruby
KlaviyoAPI::Lists.get_lists(opts)
```





#### [Update List](https://developers.klaviyo.com/en/v2023-02-22/reference/update_list)

```ruby
KlaviyoAPI::Lists.update_list(id, body)
```






## Metrics


#### [Get Metric](https://developers.klaviyo.com/en/v2023-02-22/reference/get_metric)

```ruby
KlaviyoAPI::Metrics.get_metric(id, opts)
```





#### [Get Metrics](https://developers.klaviyo.com/en/v2023-02-22/reference/get_metrics)

```ruby
KlaviyoAPI::Metrics.get_metrics(opts)
```





#### [Query Metric Aggregates](https://developers.klaviyo.com/en/v2023-02-22/reference/query_metric_aggregates)

```ruby
KlaviyoAPI::Metrics.query_metric_aggregates(body)
```






## Profiles


#### [Create Profile](https://developers.klaviyo.com/en/v2023-02-22/reference/create_profile)

```ruby
KlaviyoAPI::Profiles.create_profile(body, opts)
```





#### [Get Profile](https://developers.klaviyo.com/en/v2023-02-22/reference/get_profile)

```ruby
KlaviyoAPI::Profiles.get_profile(id, opts)
```





#### [Get Profile Lists](https://developers.klaviyo.com/en/v2023-02-22/reference/get_profile_lists)

```ruby
KlaviyoAPI::Profiles.get_profile_lists(profile_id, opts)
```





#### [Get Profile Relationships Lists](https://developers.klaviyo.com/en/v2023-02-22/reference/get_profile_relationships_lists)

```ruby
KlaviyoAPI::Profiles.get_profile_relationships_lists(id)
```





#### [Get Profile Relationships Segments](https://developers.klaviyo.com/en/v2023-02-22/reference/get_profile_relationships_segments)

```ruby
KlaviyoAPI::Profiles.get_profile_relationships_segments(id)
```





#### [Get Profile Segments](https://developers.klaviyo.com/en/v2023-02-22/reference/get_profile_segments)

```ruby
KlaviyoAPI::Profiles.get_profile_segments(profile_id, opts)
```





#### [Get Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/get_profiles)

```ruby
KlaviyoAPI::Profiles.get_profiles(opts)
```





#### [Subscribe Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/subscribe_profiles)

```ruby
KlaviyoAPI::Profiles.subscribe_profiles(body)
```





#### [Suppress Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/suppress_profiles)

```ruby
KlaviyoAPI::Profiles.suppress_profiles(body)
```





#### [Unsubscribe Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/unsubscribe_profiles)

```ruby
KlaviyoAPI::Profiles.unsubscribe_profiles(body)
```





#### [Unsuppress Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/unsuppress_profiles)

```ruby
KlaviyoAPI::Profiles.unsuppress_profiles(body)
```





#### [Update Profile](https://developers.klaviyo.com/en/v2023-02-22/reference/update_profile)

```ruby
KlaviyoAPI::Profiles.update_profile(id, body, opts)
```






## Segments


#### [Get Segment](https://developers.klaviyo.com/en/v2023-02-22/reference/get_segment)

```ruby
KlaviyoAPI::Segments.get_segment(id, opts)
```





#### [Get Segment Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/get_segment_profiles)

```ruby
KlaviyoAPI::Segments.get_segment_profiles(segment_id, opts)
```





#### [Get Segment Relationships Profiles](https://developers.klaviyo.com/en/v2023-02-22/reference/get_segment_relationships_profiles)

```ruby
KlaviyoAPI::Segments.get_segment_relationships_profiles(id, opts)
```





#### [Get Segment Relationships Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_segment_relationships_tags)

```ruby
KlaviyoAPI::Segments.get_segment_relationships_tags(id)
```





#### [Get Segment Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_segment_tags)

```ruby
KlaviyoAPI::Segments.get_segment_tags(segment_id, opts)
```





#### [Get Segments](https://developers.klaviyo.com/en/v2023-02-22/reference/get_segments)

```ruby
KlaviyoAPI::Segments.get_segments(opts)
```





#### [Update Segment](https://developers.klaviyo.com/en/v2023-02-22/reference/update_segment)

```ruby
KlaviyoAPI::Segments.update_segment(id, body)
```






## Tags


#### [Create Tag](https://developers.klaviyo.com/en/v2023-02-22/reference/create_tag)

```ruby
KlaviyoAPI::Tags.create_tag(body)
```





#### [Create Tag Group](https://developers.klaviyo.com/en/v2023-02-22/reference/create_tag_group)

```ruby
KlaviyoAPI::Tags.create_tag_group(body)
```





#### [Create Tag Relationships Campaigns](https://developers.klaviyo.com/en/v2023-02-22/reference/create_tag_relationships_campaigns)

```ruby
KlaviyoAPI::Tags.create_tag_relationships_campaigns(id, body)
```





#### [Create Tag Relationships Flows](https://developers.klaviyo.com/en/v2023-02-22/reference/create_tag_relationships_flows)

```ruby
KlaviyoAPI::Tags.create_tag_relationships_flows(id, body)
```





#### [Create Tag Relationships Lists](https://developers.klaviyo.com/en/v2023-02-22/reference/create_tag_relationships_lists)

```ruby
KlaviyoAPI::Tags.create_tag_relationships_lists(id, body)
```





#### [Create Tag Relationships Segments](https://developers.klaviyo.com/en/v2023-02-22/reference/create_tag_relationships_segments)

```ruby
KlaviyoAPI::Tags.create_tag_relationships_segments(id, body)
```





#### [Delete Tag](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_tag)

```ruby
KlaviyoAPI::Tags.delete_tag(id)
```





#### [Delete Tag Group](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_tag_group)

```ruby
KlaviyoAPI::Tags.delete_tag_group(id)
```





#### [Delete Tag Relationships Campaigns](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_tag_relationships_campaigns)

```ruby
KlaviyoAPI::Tags.delete_tag_relationships_campaigns(id, body)
```





#### [Delete Tag Relationships Flows](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_tag_relationships_flows)

```ruby
KlaviyoAPI::Tags.delete_tag_relationships_flows(id, body)
```





#### [Delete Tag Relationships Lists](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_tag_relationships_lists)

```ruby
KlaviyoAPI::Tags.delete_tag_relationships_lists(id, body)
```





#### [Delete Tag Relationships Segments](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_tag_relationships_segments)

```ruby
KlaviyoAPI::Tags.delete_tag_relationships_segments(id, body)
```





#### [Get Tag](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag)

```ruby
KlaviyoAPI::Tags.get_tag(id, opts)
```





#### [Get Tag Group](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_group)

```ruby
KlaviyoAPI::Tags.get_tag_group(id, opts)
```





#### [Get Tag Group Relationships Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_group_relationships_tags)

```ruby
KlaviyoAPI::Tags.get_tag_group_relationships_tags(id)
```





#### [Get Tag Group Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_group_tags)

```ruby
KlaviyoAPI::Tags.get_tag_group_tags(id, opts)
```





#### [Get Tag Groups](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_groups)

```ruby
KlaviyoAPI::Tags.get_tag_groups(opts)
```





#### [Get Tag Relationships Campaigns](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_relationships_campaigns)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_campaigns(id)
```





#### [Get Tag Relationships Flows](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_relationships_flows)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_flows(id)
```





#### [Get Tag Relationships Lists](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_relationships_lists)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_lists(id)
```





#### [Get Tag Relationships Segments](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_relationships_segments)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_segments(id)
```





#### [Get Tag Relationships Tag Group](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_relationships_tag_group)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_tag_group(id)
```





#### [Get Tag Tag Group](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tag_tag_group)

```ruby
KlaviyoAPI::Tags.get_tag_tag_group(id, opts)
```





#### [Get Tags](https://developers.klaviyo.com/en/v2023-02-22/reference/get_tags)

```ruby
KlaviyoAPI::Tags.get_tags(opts)
```





#### [Update Tag](https://developers.klaviyo.com/en/v2023-02-22/reference/update_tag)

```ruby
KlaviyoAPI::Tags.update_tag(id, body)
```





#### [Update Tag Group](https://developers.klaviyo.com/en/v2023-02-22/reference/update_tag_group)

```ruby
KlaviyoAPI::Tags.update_tag_group(id, body)
```






## Templates


#### [Create Template](https://developers.klaviyo.com/en/v2023-02-22/reference/create_template)

```ruby
KlaviyoAPI::Templates.create_template(body)
```





#### [Create Template Clone](https://developers.klaviyo.com/en/v2023-02-22/reference/create_template_clone)

```ruby
KlaviyoAPI::Templates.create_template_clone(body)
```





#### [Create Template Render](https://developers.klaviyo.com/en/v2023-02-22/reference/create_template_render)

```ruby
KlaviyoAPI::Templates.create_template_render(body)
```





#### [Delete Template](https://developers.klaviyo.com/en/v2023-02-22/reference/delete_template)

```ruby
KlaviyoAPI::Templates.delete_template(id)
```





#### [Get Template](https://developers.klaviyo.com/en/v2023-02-22/reference/get_template)

```ruby
KlaviyoAPI::Templates.get_template(id, opts)
```





#### [Get Templates](https://developers.klaviyo.com/en/v2023-02-22/reference/get_templates)

```ruby
KlaviyoAPI::Templates.get_templates(opts)
```





#### [Update Template](https://developers.klaviyo.com/en/v2023-02-22/reference/update_template)

```ruby
KlaviyoAPI::Templates.update_template(id, body)
```





# Appendix

## Per Request API key
```ruby
response = KlaviyoAPI::Catalogs.get_catalog_items({
  header_params: {
    'Authorization': 'Klaviyo-API-Key your-api-key',
  },
  debug_auth_names: []
})
```
