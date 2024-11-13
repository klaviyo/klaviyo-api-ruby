# Klaviyo Ruby SDK

- SDK version: 11.0.0
- API revision: 2024-10-15

## Helpful Resources

- [API Reference](https://developers.klaviyo.com/en/v2024-10-15/reference)
- [API Guides](https://developers.klaviyo.com/en/v2024-10-15/docs)
- [Postman Workspace](https://www.postman.com/klaviyo/workspace/klaviyo-developers)

## Design & Approach

This SDK is a thin wrapper around our API. See our API Reference for full documentation on API behavior.

## Organization

This SDK is organized into the following resources:



- Accounts



- Campaigns



- Catalogs



- Coupons



- Data Privacy



- Events



- Flows



- Forms



- Images



- Lists



- Metrics



- Profiles



- Reporting



- Reviews



- Segments



- Tags



- Templates



- Tracking Settings



- Webhooks




## Installation


### Build

To build the Ruby code into a gem:

```shell
gem build klaviyo-api-sdk.gemspec
```

Then install the gem locally:

```shell
gem install ./klaviyo-api-sdk-11.0.0.gem
```


Finally add this to the Gemfile:

    gem 'klaviyo-api-sdk', '~> 11.0.0'

To install directly from rubygems:

```shell
gem install klaviyo-api-sdk
```

### For macOS developers

To avoid compatability issues between macOS and the underlying HTTP client library (Typhoeus), add the following to your local bash file:

```
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
```

As the issue only affects macOS, it should not affect your production environment. Check [this thread](https://github.com/rails/rails/issues/38560) for more information.

## Usage Example

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
* `max_retries` denotes the number of attempts the client will make in order to execute the request successfully.
  * Set to 0 to disable automatic retries
* `max_delay` denotes the maximum amount of time (in seconds) that will be spent retrying a request across all attempts.
* The time interval between retries is calculated using exponential backoff and the `Retry-After` header.

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

## Error Handling

This SDK throws an `ApiException` error when the server returns a non-`2XX` response. 
```ruby
begin
  result = KlaviyoAPI::Catalogs.get_catalog_items(opts)
rescue KlaviyoAPI::ApiError => e
  puts "Error when calling get_catalog_items #{e}"
end
```

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
For `GET` methods that require a filter, Pass the filter perameter as a query paraemeter not inside the `opts` object

   ```
    KlaviyoAPI::Campaigns.get_campaigns("equals(messages.channel,'email')")
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

For uploading a file using the `Images.upload_image_from_file` simply pass in an opened file
```ruby
result = KlaviyoAPI::Images.upload_image_from_file(File.open('test_file.jpg', 'r'))
```


## Optional Parameters and Json Api Features

Here we will go over

- Pagination
- Page size
- Additional Fields
- Filtering
- Sparse Fields
- Sorting
- Relationships

### Quick rule

As a reminder, the optional parameters are named slightly different from how you would make the call without the SDK docs, query parameter names have variables that make bad Ruby names like
`page[cursor]` are transformed to `page_cursor`.

### Cursor based Pagination

All the endpoints that return list of results use cursor base pagination.

Obtain the cursor value from the call you want to get the next page for, then pass it under the `page_cursor` optional parameter. The page cursor looks like `WzE2NDA5OTUyMDAsICIzYzRjeXdGTndadyIsIHRydWVd`.

If you were using the api directly you would pass the cursor like:

```
https://a.klaviyo.com/api/profiles/?page[cursor]=WzE2NTcyMTM4NjQsICIzc042NjRyeHo0ciIsIHRydWVd
```

The same call in the sdk the call would look like this:

```ruby
opts = {
  page_cursor: 'WzE2NTcyMTM4NjQsICIzc042NjRyeHo0ciIsIHRydWVd',
}

response = KlaviyoAPI::Profiles.get_profiles(opts)
```

You get the cursor for the next page from `response[:links][:next]` returns the entire url of the next call but the sdk will accept the entire link and use only the relevant cursor.

Here is an example of getting the second next and passing in the page cursor:

```ruby
opts = {
  page_cursor: response[:links][:next], # previous response
}

response = KlaviyoAPI::Profiles.get_profiles(opts)
```

There are more page cursors than just next, check the endpoint's docs or the response type but often there is `first`, `last`, `next` and `prev`.

### Page Size
Some endpoint you can get a larger or smaller page size by using the `page_size` parameter.

if you were hitting the api directly this would look like

```
https://a.klaviyo.com/api/profiles/?page[size]=20
```

In the SDK this looks like:

```ruby
opts = {
  page_size: 20,
}

response = KlaviyoAPI::Profiles.get_profiles(opts)
```

### Additional Fields

Additional fields are used to populate part of the response that would be null otherwise.
For the `getProfile` endpoint you can pass in a request to get the predictive analytics of the profile. Using the `additional_fields` parameter often will change the rate limit of the endpoint so be sure to keep an eye on your usage.

The url would look like:
```
https://a.klaviyo.com/api/profiles/01GDDKASAP8TKDDA2GRZDSVP4H/?additional-fields[profile]=predictive_analytics
```

The SDK equivalent is:

```ruby
profile_id = '01GDDKASAP8TKDDA2GRZDSVP4H'
opts = {
  additional_fields_profile: ["predictive_analytics"]
}

response = KlaviyoAPI::Profiles.get_profile(profile_id, opts)

# If your profile has enough information for predictive analytis it will populate
pp(response[:data][:attributes][:predictive_analytics])
```

### Filtering

Filter by passing the filter as a string as under the optional parameter `filter`.

Read more about formatting your filter strings in our [developer documentation](https://developers.klaviyo.com/en/v2023-02-22/docs/filtering_)

Here is an example of a filter string for results between two date times: `less-than(updated,2023-04-26T00:00:00Z),greater-than(updated,2023-04-19T00:00:00Z)`

Here is a code example filter for profiles with the matching emails:

```
https://a.klaviyo.com/api/profiles/?filter=any(email,["henry.chan@klaviyo-demo.com","amanda.das@klaviyo-demo.com"]
```
For the sdk:
```ruby
opts = {
  filter: 'any(email,["henry.chan@klaviyo-demo.com","amanda.das@klaviyo-demo.com"])'
}

response = KlaviyoAPI::Profiles.get_profiles(opts)
```

### Sparse Fields

If you only want a specific subset of data from a specific query you can use sparse fields to request only the specific properties.
The SDK expands the optional sparse fields into their own option, where you can pass a list of the desired items to include.

To get a list of event properties the URL your would use is:
```
https://a.klaviyo.com/api/events/?fields[event]=event_properties
```

In the SDK you would use

```ruby
opts = {
  fields_event: ["event_properties"]
}

response = KlaviyoAPI::Events.get_events(opts)
```

### Sorting

Your can request the results of specific endpoints to be ordered by a given parameter. The direction of the sort can swapped by adding a `-` in front of the sort key.
For example `datetime` will be ascending while `-datetime` will be descending.

If you are unsure about the available sort fields you can always check the documentation for the endpoint you are using.
For a comprehensive list that links to the documentation for each function check the Endpoints section below.

Get events sorted by oldest to newest datetime.
```
https://a.klaviyo.com/api/events/?sort=-datetime
```
and via the sdk

```ruby
opts = {
  sort: '-datetime'
}

response = KlaviyoAPI::Events.get_events(opts)
```

### Includes

How to add additional information to your API response via additional-fields and the `includes` parameter.
This allows you to get information about two or more objects from a single api call.
Using the `includes` parameter often changes the rate limit of the endpoint so be sure to take note.

Using the URl to get profile information and the information about the lists the profile is in:

```
https://a.klaviyo.com/api/profiles/01GDDKASAP8TKDDA2GRZDSVP4H/?include=lists
```

In the sdk:

```ruby
profile_id = '01GDDKASAP8TKDDA2GRZDSVP4H'
opts = {
  include: ["lists"]
}

response = KlaviyoAPI::Profiles.get_profile(profile_id,opts)

# Profile information is accessed the same way with
pp(response[:data])
# Lists related to the profile with be accessible via the included array
pp(response[:included])
```

*Note about sparse fields and relationships:* you can request only specific fields of the included object as well.

```ruby
profile_id = '01GDDKASAP8TKDDA2GRZDSVP4H'
opts = {
  fields_list: ["name"],
  include: ["lists"]
}

response = KlaviyoAPI::Profiles.get_profile(profile_id,opts)



# Profile information is accessed the same way with
pp(response[:data])
# Lists related to the profile with be accessible via the included array
pp(response[:included])
```

### Relationships

The Klaviyo Api has a series of endpoints to expose the relationships between your different Klaviyo Items. You can read more about relationships in [our documentation](https://developers.klaviyo.com/en/v2023-02-22/docs/relationships_).

Here are some use cases and their examples:

How to get the list memberships for a profile with the given profile ID.

Via the URL:

```
https://a.klaviyo.com/api/profiles/01GDDKASAP8TKDDA2GRZDSVP4H/relationships/lists/
```

and for the SDK:

```ruby
profile_id = '01GDDKASAP8TKDDA2GRZDSVP4H'

response = KlaviyoAPI::Profiles.get_profile_relationships_lists(profile_id)
```

For another example:

Get all campaigns associated with the given `tag_id`.

the URL:

```
https://a.klaviyo.com/api/tags/9c8db7a0-5ab5-4e3c-9a37-a3224fd14382/relationships/campaigns/
```

Through the SDK:

```ruby
tag_id = '9c8db7a0-5ab5-4e3c-9a37-a3224fd14382'

response = KlaviyoAPI::Tags.get_tag_relationships_campaigns(tag_id)
```
### Combining

You can use any combination of the features outlines above in conjunction with one another.

#### Get events associated with a specific metric, then return just the event properties sorted by oldest to newest datetime.

```
https://a.klaviyo.com/api/events/?fields[event]=event_properties&filter=equals(metric_id,"URDbLg")&sort=-datetime
```
or
```ruby
opts = {
  filter: 'equals(metric_id,"URDbLg")',
  fields_event: ["event_properties"]
}

response = KlaviyoAPI::Events.get_events(opts)
```

## Comprehensive list of Operations & Parameters

_**NOTE:**_
- Organization: Resource groups and operation_ids are listed in alphabetical order, first by Resource name, then by **OpenAPI Summary**. Operation summaries are those listed in the right side bar of the [API Reference](https://developers.klaviyo.com/en/v2024-10-15/reference/get_events).
- For example values / data types, as well as whether parameters are required/optional, please reference the corresponding API Reference link.
- Some args are required for the API call to succeed, the API docs above are the source of truth regarding which params are required.






## Accounts


#### [Get Account](https://developers.klaviyo.com/en/v2024-10-15/reference/get_account)

```ruby
KlaviyoAPI::Accounts.get_account(id, opts)
```





#### [Get Accounts](https://developers.klaviyo.com/en/v2024-10-15/reference/get_accounts)

```ruby
KlaviyoAPI::Accounts.get_accounts(opts)
```






## Campaigns


#### [Assign Template to Campaign Message](https://developers.klaviyo.com/en/v2024-10-15/reference/assign_template_to_campaign_message)

```ruby
KlaviyoAPI::Campaigns.assign_template_to_campaign_message(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.create_campaign_message_assign_template(body)
```





#### [Cancel Campaign Send](https://developers.klaviyo.com/en/v2024-10-15/reference/cancel_campaign_send)

```ruby
KlaviyoAPI::Campaigns.cancel_campaign_send(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.update_campaign_send_job(id, body)
```





#### [Create Campaign](https://developers.klaviyo.com/en/v2024-10-15/reference/create_campaign)

```ruby
KlaviyoAPI::Campaigns.create_campaign(body)
```





#### [Create Campaign Clone](https://developers.klaviyo.com/en/v2024-10-15/reference/create_campaign_clone)

```ruby
KlaviyoAPI::Campaigns.create_campaign_clone(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.clone_campaign(body)
```





#### [Delete Campaign](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_campaign)

```ruby
KlaviyoAPI::Campaigns.delete_campaign(id)
```





#### [Get Campaign](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaign)

```ruby
KlaviyoAPI::Campaigns.get_campaign(id, opts)
```





#### [Get Campaign for Campaign Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaign_for_campaign_message)

```ruby
KlaviyoAPI::Campaigns.get_campaign_for_campaign_message(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.get_campaign_message_campaign(id, opts)
```





#### [Get Campaign ID for Campaign Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaign_id_for_campaign_message)

```ruby
KlaviyoAPI::Campaigns.get_campaign_id_for_campaign_message(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.get_campaign_message_relationships_campaign(id)
```





#### [Get Campaign Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaign_message)

```ruby
KlaviyoAPI::Campaigns.get_campaign_message(id, opts)
```





#### [Get Campaign Recipient Estimation](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaign_recipient_estimation)

```ruby
KlaviyoAPI::Campaigns.get_campaign_recipient_estimation(id, opts)
```





#### [Get Campaign Recipient Estimation Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaign_recipient_estimation_job)

```ruby
KlaviyoAPI::Campaigns.get_campaign_recipient_estimation_job(id, opts)
```





#### [Get Campaign Send Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaign_send_job)

```ruby
KlaviyoAPI::Campaigns.get_campaign_send_job(id, opts)
```





#### [Get Campaign Tags](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaign_tags)

```ruby
KlaviyoAPI::Campaigns.get_campaign_tags(id, opts)
```





#### [Get Campaigns](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaigns)

```ruby
KlaviyoAPI::Campaigns.get_campaigns(filter, opts)
```





#### [Get Message IDs for Campaign](https://developers.klaviyo.com/en/v2024-10-15/reference/get_message_ids_for_campaign)

```ruby
KlaviyoAPI::Campaigns.get_message_ids_for_campaign(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.get_campaign_relationships_campaign_messages(id)
```





#### [Get Messages for Campaign](https://developers.klaviyo.com/en/v2024-10-15/reference/get_messages_for_campaign)

```ruby
KlaviyoAPI::Campaigns.get_messages_for_campaign(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.get_campaign_campaign_messages(id, opts)
```





#### [Get Tag IDs for Campaign](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag_ids_for_campaign)

```ruby
KlaviyoAPI::Campaigns.get_tag_ids_for_campaign(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.get_campaign_relationships_tags(id)
```





#### [Get Template for Campaign Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_template_for_campaign_message)

```ruby
KlaviyoAPI::Campaigns.get_template_for_campaign_message(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.get_campaign_message_template(id, opts)
```





#### [Get Template ID for Campaign Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_template_id_for_campaign_message)

```ruby
KlaviyoAPI::Campaigns.get_template_id_for_campaign_message(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.get_campaign_message_relationships_template(id)
```





#### [Refresh Campaign Recipient Estimation](https://developers.klaviyo.com/en/v2024-10-15/reference/refresh_campaign_recipient_estimation)

```ruby
KlaviyoAPI::Campaigns.refresh_campaign_recipient_estimation(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.create_campaign_recipient_estimation_job(body)
```





#### [Send Campaign](https://developers.klaviyo.com/en/v2024-10-15/reference/send_campaign)

```ruby
KlaviyoAPI::Campaigns.send_campaign(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Campaigns.create_campaign_send_job(body)
```





#### [Update Campaign](https://developers.klaviyo.com/en/v2024-10-15/reference/update_campaign)

```ruby
KlaviyoAPI::Campaigns.update_campaign(id, body)
```





#### [Update Campaign Message](https://developers.klaviyo.com/en/v2024-10-15/reference/update_campaign_message)

```ruby
KlaviyoAPI::Campaigns.update_campaign_message(id, body)
```






## Catalogs


#### [Add Category to Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/add_category_to_catalog_item)

```ruby
KlaviyoAPI::Catalogs.add_category_to_catalog_item(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_item_relationships_categories(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_item_relationships_category(id, body)
```





#### [Add Items to Catalog Category](https://developers.klaviyo.com/en/v2024-10-15/reference/add_items_to_catalog_category)

```ruby
KlaviyoAPI::Catalogs.add_items_to_catalog_category(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_category_relationships_items(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_category_relationships_item(id, body)
```





#### [Bulk Create Catalog Categories](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_create_catalog_categories)

```ruby
KlaviyoAPI::Catalogs.bulk_create_catalog_categories(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.spawn_create_categories_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_category_bulk_create_job(body)
```





#### [Bulk Create Catalog Items](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_create_catalog_items)

```ruby
KlaviyoAPI::Catalogs.bulk_create_catalog_items(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.spawn_create_items_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_item_bulk_create_job(body)
```





#### [Bulk Create Catalog Variants](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_create_catalog_variants)

```ruby
KlaviyoAPI::Catalogs.bulk_create_catalog_variants(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.spawn_create_variants_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_variant_bulk_create_job(body)
```





#### [Bulk Delete Catalog Categories](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_delete_catalog_categories)

```ruby
KlaviyoAPI::Catalogs.bulk_delete_catalog_categories(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.spawn_delete_categories_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_category_bulk_delete_job(body)
```





#### [Bulk Delete Catalog Items](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_delete_catalog_items)

```ruby
KlaviyoAPI::Catalogs.bulk_delete_catalog_items(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.spawn_delete_items_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_item_bulk_delete_job(body)
```





#### [Bulk Delete Catalog Variants](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_delete_catalog_variants)

```ruby
KlaviyoAPI::Catalogs.bulk_delete_catalog_variants(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.spawn_delete_variants_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_variant_bulk_delete_job(body)
```





#### [Bulk Update Catalog Categories](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_update_catalog_categories)

```ruby
KlaviyoAPI::Catalogs.bulk_update_catalog_categories(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.spawn_update_categories_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_category_bulk_update_job(body)
```





#### [Bulk Update Catalog Items](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_update_catalog_items)

```ruby
KlaviyoAPI::Catalogs.bulk_update_catalog_items(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.spawn_update_items_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_item_bulk_update_job(body)
```





#### [Bulk Update Catalog Variants](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_update_catalog_variants)

```ruby
KlaviyoAPI::Catalogs.bulk_update_catalog_variants(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.spawn_update_variants_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.create_catalog_variant_bulk_update_job(body)
```





#### [Create Back In Stock Subscription](https://developers.klaviyo.com/en/v2024-10-15/reference/create_back_in_stock_subscription)

```ruby
KlaviyoAPI::Catalogs.create_back_in_stock_subscription(body)
```





#### [Create Catalog Category](https://developers.klaviyo.com/en/v2024-10-15/reference/create_catalog_category)

```ruby
KlaviyoAPI::Catalogs.create_catalog_category(body)
```





#### [Create Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/create_catalog_item)

```ruby
KlaviyoAPI::Catalogs.create_catalog_item(body)
```





#### [Create Catalog Variant](https://developers.klaviyo.com/en/v2024-10-15/reference/create_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.create_catalog_variant(body)
```





#### [Delete Catalog Category](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_catalog_category)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_category(id)
```





#### [Delete Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_catalog_item)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_item(id)
```





#### [Delete Catalog Variant](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_variant(id)
```





#### [Get Bulk Create Catalog Items Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_create_catalog_items_job)

```ruby
KlaviyoAPI::Catalogs.get_bulk_create_catalog_items_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_create_items_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_item_bulk_create_job(job_id, opts)
```





#### [Get Bulk Create Catalog Items Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_create_catalog_items_jobs)

```ruby
KlaviyoAPI::Catalogs.get_bulk_create_catalog_items_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_create_items_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_item_bulk_create_jobs(opts)
```





#### [Get Bulk Delete Catalog Items Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_delete_catalog_items_job)

```ruby
KlaviyoAPI::Catalogs.get_bulk_delete_catalog_items_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_delete_items_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_item_bulk_delete_job(job_id, opts)
```





#### [Get Bulk Delete Catalog Items Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_delete_catalog_items_jobs)

```ruby
KlaviyoAPI::Catalogs.get_bulk_delete_catalog_items_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_delete_items_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_item_bulk_delete_jobs(opts)
```





#### [Get Bulk Update Catalog Items Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_update_catalog_items_job)

```ruby
KlaviyoAPI::Catalogs.get_bulk_update_catalog_items_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_update_items_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_item_bulk_update_job(job_id, opts)
```





#### [Get Bulk Update Catalog Items Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_update_catalog_items_jobs)

```ruby
KlaviyoAPI::Catalogs.get_bulk_update_catalog_items_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_update_items_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_item_bulk_update_jobs(opts)
```





#### [Get Catalog Categories](https://developers.klaviyo.com/en/v2024-10-15/reference/get_catalog_categories)

```ruby
KlaviyoAPI::Catalogs.get_catalog_categories(opts)
```





#### [Get Catalog Category](https://developers.klaviyo.com/en/v2024-10-15/reference/get_catalog_category)

```ruby
KlaviyoAPI::Catalogs.get_catalog_category(id, opts)
```





#### [Get Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/get_catalog_item)

```ruby
KlaviyoAPI::Catalogs.get_catalog_item(id, opts)
```





#### [Get Catalog Items](https://developers.klaviyo.com/en/v2024-10-15/reference/get_catalog_items)

```ruby
KlaviyoAPI::Catalogs.get_catalog_items(opts)
```





#### [Get Catalog Variant](https://developers.klaviyo.com/en/v2024-10-15/reference/get_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.get_catalog_variant(id, opts)
```





#### [Get Catalog Variants](https://developers.klaviyo.com/en/v2024-10-15/reference/get_catalog_variants)

```ruby
KlaviyoAPI::Catalogs.get_catalog_variants(opts)
```





#### [Get Categories for Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/get_categories_for_catalog_item)

```ruby
KlaviyoAPI::Catalogs.get_categories_for_catalog_item(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_item_categories(id, opts)
```





#### [Get Category IDs for Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/get_category_ids_for_catalog_item)

```ruby
KlaviyoAPI::Catalogs.get_category_ids_for_catalog_item(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_item_relationships_categories(id, opts)
```





#### [Get Create Categories Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_create_categories_job)

```ruby
KlaviyoAPI::Catalogs.get_create_categories_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_category_bulk_create_job(job_id, opts)
```





#### [Get Create Categories Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_create_categories_jobs)

```ruby
KlaviyoAPI::Catalogs.get_create_categories_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_category_bulk_create_jobs(opts)
```





#### [Get Create Variants Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_create_variants_job)

```ruby
KlaviyoAPI::Catalogs.get_create_variants_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_variant_bulk_create_job(job_id, opts)
```





#### [Get Create Variants Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_create_variants_jobs)

```ruby
KlaviyoAPI::Catalogs.get_create_variants_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_variant_bulk_create_jobs(opts)
```





#### [Get Delete Categories Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_delete_categories_job)

```ruby
KlaviyoAPI::Catalogs.get_delete_categories_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_category_bulk_delete_job(job_id, opts)
```





#### [Get Delete Categories Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_delete_categories_jobs)

```ruby
KlaviyoAPI::Catalogs.get_delete_categories_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_category_bulk_delete_jobs(opts)
```





#### [Get Delete Variants Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_delete_variants_job)

```ruby
KlaviyoAPI::Catalogs.get_delete_variants_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_variant_bulk_delete_job(job_id, opts)
```





#### [Get Delete Variants Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_delete_variants_jobs)

```ruby
KlaviyoAPI::Catalogs.get_delete_variants_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_variant_bulk_delete_jobs(opts)
```





#### [Get Item IDs for Catalog Category](https://developers.klaviyo.com/en/v2024-10-15/reference/get_item_ids_for_catalog_category)

```ruby
KlaviyoAPI::Catalogs.get_item_ids_for_catalog_category(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_category_relationships_items(id, opts)
```





#### [Get Items for Catalog Category](https://developers.klaviyo.com/en/v2024-10-15/reference/get_items_for_catalog_category)

```ruby
KlaviyoAPI::Catalogs.get_items_for_catalog_category(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_category_items(id, opts)
```





#### [Get Update Categories Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_update_categories_job)

```ruby
KlaviyoAPI::Catalogs.get_update_categories_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_category_bulk_update_job(job_id, opts)
```





#### [Get Update Categories Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_update_categories_jobs)

```ruby
KlaviyoAPI::Catalogs.get_update_categories_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_category_bulk_update_jobs(opts)
```





#### [Get Update Variants Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_update_variants_job)

```ruby
KlaviyoAPI::Catalogs.get_update_variants_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_variant_bulk_update_job(job_id, opts)
```





#### [Get Update Variants Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_update_variants_jobs)

```ruby
KlaviyoAPI::Catalogs.get_update_variants_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_variant_bulk_update_jobs(opts)
```





#### [Get Variants for Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/get_variants_for_catalog_item)

```ruby
KlaviyoAPI::Catalogs.get_variants_for_catalog_item(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.get_catalog_item_variants(id, opts)
```





#### [Remove Categories from Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/remove_categories_from_catalog_item)

```ruby
KlaviyoAPI::Catalogs.remove_categories_from_catalog_item(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.delete_catalog_item_relationships_categories(id, body)
```





#### [Remove Items from Catalog Category](https://developers.klaviyo.com/en/v2024-10-15/reference/remove_items_from_catalog_category)

```ruby
KlaviyoAPI::Catalogs.remove_items_from_catalog_category(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.delete_catalog_category_relationships_items(id, body)
```





#### [Update Catalog Category](https://developers.klaviyo.com/en/v2024-10-15/reference/update_catalog_category)

```ruby
KlaviyoAPI::Catalogs.update_catalog_category(id, body)
```





#### [Update Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/update_catalog_item)

```ruby
KlaviyoAPI::Catalogs.update_catalog_item(id, body)
```





#### [Update Catalog Variant](https://developers.klaviyo.com/en/v2024-10-15/reference/update_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.update_catalog_variant(id, body)
```





#### [Update Categories for Catalog Item](https://developers.klaviyo.com/en/v2024-10-15/reference/update_categories_for_catalog_item)

```ruby
KlaviyoAPI::Catalogs.update_categories_for_catalog_item(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.update_catalog_item_relationships_categories(id, body)
```





#### [Update Items for Catalog Category](https://developers.klaviyo.com/en/v2024-10-15/reference/update_items_for_catalog_category)

```ruby
KlaviyoAPI::Catalogs.update_items_for_catalog_category(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Catalogs.update_catalog_category_relationships_items(id, body)
```






## Coupons


#### [Bulk Create Coupon Codes](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_create_coupon_codes)

```ruby
KlaviyoAPI::Coupons.bulk_create_coupon_codes(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Coupons.spawn_coupon_code_bulk_create_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Coupons.create_coupon_code_bulk_create_job(body)
```





#### [Create Coupon](https://developers.klaviyo.com/en/v2024-10-15/reference/create_coupon)

```ruby
KlaviyoAPI::Coupons.create_coupon(body)
```





#### [Create Coupon Code](https://developers.klaviyo.com/en/v2024-10-15/reference/create_coupon_code)

```ruby
KlaviyoAPI::Coupons.create_coupon_code(body)
```





#### [Delete Coupon](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_coupon)

```ruby
KlaviyoAPI::Coupons.delete_coupon(id)
```





#### [Delete Coupon Code](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_coupon_code)

```ruby
KlaviyoAPI::Coupons.delete_coupon_code(id)
```





#### [Get Bulk Create Coupon Code Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_create_coupon_code_jobs)

```ruby
KlaviyoAPI::Coupons.get_bulk_create_coupon_code_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Coupons.get_coupon_code_bulk_create_jobs(opts)
```





#### [Get Bulk Create Coupon Codes Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_create_coupon_codes_job)

```ruby
KlaviyoAPI::Coupons.get_bulk_create_coupon_codes_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Coupons.get_coupon_code_bulk_create_job(job_id, opts)
```





#### [Get Code IDs for Coupon](https://developers.klaviyo.com/en/v2024-10-15/reference/get_code_ids_for_coupon)

```ruby
KlaviyoAPI::Coupons.get_code_ids_for_coupon(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Coupons.get_coupon_code_relationships_coupon(id, opts)
```





#### [Get Coupon](https://developers.klaviyo.com/en/v2024-10-15/reference/get_coupon)

```ruby
KlaviyoAPI::Coupons.get_coupon(id, opts)
```





#### [Get Coupon Code](https://developers.klaviyo.com/en/v2024-10-15/reference/get_coupon_code)

```ruby
KlaviyoAPI::Coupons.get_coupon_code(id, opts)
```





#### [Get Coupon Codes](https://developers.klaviyo.com/en/v2024-10-15/reference/get_coupon_codes)

```ruby
KlaviyoAPI::Coupons.get_coupon_codes(opts)
```





#### [Get Coupon Codes For Coupon](https://developers.klaviyo.com/en/v2024-10-15/reference/get_coupon_codes_for_coupon)

```ruby
KlaviyoAPI::Coupons.get_coupon_codes_for_coupon(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Coupons.get_coupon_coupon_codes(id, opts)
```





#### [Get Coupon For Coupon Code](https://developers.klaviyo.com/en/v2024-10-15/reference/get_coupon_for_coupon_code)

```ruby
KlaviyoAPI::Coupons.get_coupon_for_coupon_code(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Coupons.get_coupon_code_coupon(id, opts)
```





#### [Get Coupon ID for Coupon Code](https://developers.klaviyo.com/en/v2024-10-15/reference/get_coupon_id_for_coupon_code)

```ruby
KlaviyoAPI::Coupons.get_coupon_id_for_coupon_code(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Coupons.get_coupon_relationships_coupon_codes(id)
```





#### [Get Coupons](https://developers.klaviyo.com/en/v2024-10-15/reference/get_coupons)

```ruby
KlaviyoAPI::Coupons.get_coupons(opts)
```





#### [Update Coupon](https://developers.klaviyo.com/en/v2024-10-15/reference/update_coupon)

```ruby
KlaviyoAPI::Coupons.update_coupon(id, body)
```





#### [Update Coupon Code](https://developers.klaviyo.com/en/v2024-10-15/reference/update_coupon_code)

```ruby
KlaviyoAPI::Coupons.update_coupon_code(id, body)
```






## Data Privacy


#### [Request Profile Deletion](https://developers.klaviyo.com/en/v2024-10-15/reference/request_profile_deletion)

```ruby
KlaviyoAPI::DataPrivacy.request_profile_deletion(body)
```
##### Method alias:
```ruby
KlaviyoAPI::DataPrivacy.create_data_privacy_deletion_job(body)
```






## Events


#### [Bulk Create Events](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_create_events)

```ruby
KlaviyoAPI::Events.bulk_create_events(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Events.create_event_bulk_create_job(body)
```





#### [Create Event](https://developers.klaviyo.com/en/v2024-10-15/reference/create_event)

```ruby
KlaviyoAPI::Events.create_event(body)
```





#### [Get Event](https://developers.klaviyo.com/en/v2024-10-15/reference/get_event)

```ruby
KlaviyoAPI::Events.get_event(id, opts)
```





#### [Get Event Metric](https://developers.klaviyo.com/en/v2024-10-15/reference/get_event_metric)

```ruby
KlaviyoAPI::Events.get_event_metric(id, opts)
```





#### [Get Event Profile](https://developers.klaviyo.com/en/v2024-10-15/reference/get_event_profile)

```ruby
KlaviyoAPI::Events.get_event_profile(id, opts)
```





#### [Get Events](https://developers.klaviyo.com/en/v2024-10-15/reference/get_events)

```ruby
KlaviyoAPI::Events.get_events(opts)
```





#### [Get Metric ID for Event](https://developers.klaviyo.com/en/v2024-10-15/reference/get_metric_id_for_event)

```ruby
KlaviyoAPI::Events.get_metric_id_for_event(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Events.get_event_relationships_metric(id)
```





#### [Get Profile ID for Event](https://developers.klaviyo.com/en/v2024-10-15/reference/get_profile_id_for_event)

```ruby
KlaviyoAPI::Events.get_profile_id_for_event(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Events.get_event_relationships_profile(id)
```






## Flows


#### [Delete Flow](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_flow)

```ruby
KlaviyoAPI::Flows.delete_flow(id)
```





#### [Get Action ID for Flow Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_action_id_for_flow_message)

```ruby
KlaviyoAPI::Flows.get_action_id_for_flow_message(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Flows.get_flow_message_relationships_action(id)
```





#### [Get Action IDs for Flow](https://developers.klaviyo.com/en/v2024-10-15/reference/get_action_ids_for_flow)

```ruby
KlaviyoAPI::Flows.get_action_ids_for_flow(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Flows.get_flow_relationships_flow_actions(id, opts)
```





#### [Get Actions for Flow](https://developers.klaviyo.com/en/v2024-10-15/reference/get_actions_for_flow)

```ruby
KlaviyoAPI::Flows.get_actions_for_flow(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Flows.get_flow_flow_actions(id, opts)
```





#### [Get Flow](https://developers.klaviyo.com/en/v2024-10-15/reference/get_flow)

```ruby
KlaviyoAPI::Flows.get_flow(id, opts)
```





#### [Get Flow Action](https://developers.klaviyo.com/en/v2024-10-15/reference/get_flow_action)

```ruby
KlaviyoAPI::Flows.get_flow_action(id, opts)
```





#### [Get Flow For Flow Action](https://developers.klaviyo.com/en/v2024-10-15/reference/get_flow_action_flow)

```ruby
KlaviyoAPI::Flows.get_flow_action_flow(id, opts)
```





#### [Get Flow ID for Flow Action](https://developers.klaviyo.com/en/v2024-10-15/reference/get_flow_id_for_flow_action)

```ruby
KlaviyoAPI::Flows.get_flow_id_for_flow_action(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Flows.get_flow_action_relationships_flow(id)
```





#### [Get Flow Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_flow_message)

```ruby
KlaviyoAPI::Flows.get_flow_message(id, opts)
```





#### [Get Flow Action For Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_flow_message_action)

```ruby
KlaviyoAPI::Flows.get_flow_message_action(id, opts)
```





#### [Get Flow Tags](https://developers.klaviyo.com/en/v2024-10-15/reference/get_flow_tags)

```ruby
KlaviyoAPI::Flows.get_flow_tags(id, opts)
```





#### [Get Flows](https://developers.klaviyo.com/en/v2024-10-15/reference/get_flows)

```ruby
KlaviyoAPI::Flows.get_flows(opts)
```





#### [Get Message IDs for Flow Action](https://developers.klaviyo.com/en/v2024-10-15/reference/get_message_ids_for_flow_action)

```ruby
KlaviyoAPI::Flows.get_message_ids_for_flow_action(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Flows.get_flow_action_relationships_messages(id, opts)
```





#### [Get Messages for Flow Action](https://developers.klaviyo.com/en/v2024-10-15/reference/get_messages_for_flow_action)

```ruby
KlaviyoAPI::Flows.get_messages_for_flow_action(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Flows.get_flow_action_messages(id, opts)
```





#### [Get Tag IDs for Flow](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag_ids_for_flow)

```ruby
KlaviyoAPI::Flows.get_tag_ids_for_flow(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Flows.get_flow_relationships_tags(id)
```





#### [Get Template for Flow Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_template_for_flow_message)

```ruby
KlaviyoAPI::Flows.get_template_for_flow_message(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Flows.get_flow_message_template(id, opts)
```





#### [Get Template ID for Flow Message](https://developers.klaviyo.com/en/v2024-10-15/reference/get_template_id_for_flow_message)

```ruby
KlaviyoAPI::Flows.get_template_id_for_flow_message(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Flows.get_flow_message_relationships_template(id)
```





#### [Update Flow Status](https://developers.klaviyo.com/en/v2024-10-15/reference/update_flow)

```ruby
KlaviyoAPI::Flows.update_flow(id, body)
```






## Forms


#### [Get Form](https://developers.klaviyo.com/en/v2024-10-15/reference/get_form)

```ruby
KlaviyoAPI::Forms.get_form(id, opts)
```





#### [Get Form for Form Version](https://developers.klaviyo.com/en/v2024-10-15/reference/get_form_for_form_version)

```ruby
KlaviyoAPI::Forms.get_form_for_form_version(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Forms.get_form_version_form(id, opts)
```





#### [Get Form ID for Form Version](https://developers.klaviyo.com/en/v2024-10-15/reference/get_form_id_for_form_version)

```ruby
KlaviyoAPI::Forms.get_form_id_for_form_version(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Forms.get_form_version_relationships_form(id)
```





#### [Get Form Version](https://developers.klaviyo.com/en/v2024-10-15/reference/get_form_version)

```ruby
KlaviyoAPI::Forms.get_form_version(id, opts)
```





#### [Get Forms](https://developers.klaviyo.com/en/v2024-10-15/reference/get_forms)

```ruby
KlaviyoAPI::Forms.get_forms(opts)
```





#### [Get Version IDs for Form](https://developers.klaviyo.com/en/v2024-10-15/reference/get_version_ids_for_form)

```ruby
KlaviyoAPI::Forms.get_version_ids_for_form(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Forms.get_form_relationships_form_versions(id)
```





#### [Get Versions for Form](https://developers.klaviyo.com/en/v2024-10-15/reference/get_versions_for_form)

```ruby
KlaviyoAPI::Forms.get_versions_for_form(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Forms.get_form_form_versions(id, opts)
```






## Images


#### [Get Image](https://developers.klaviyo.com/en/v2024-10-15/reference/get_image)

```ruby
KlaviyoAPI::Images.get_image(id, opts)
```





#### [Get Images](https://developers.klaviyo.com/en/v2024-10-15/reference/get_images)

```ruby
KlaviyoAPI::Images.get_images(opts)
```





#### [Update Image](https://developers.klaviyo.com/en/v2024-10-15/reference/update_image)

```ruby
KlaviyoAPI::Images.update_image(id, body)
```





#### [Upload Image From File](https://developers.klaviyo.com/en/v2024-10-15/reference/upload_image_from_file)

```ruby
KlaviyoAPI::Images.upload_image_from_file(file, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Images.create_image_upload(file, opts)
```





#### [Upload Image From URL](https://developers.klaviyo.com/en/v2024-10-15/reference/upload_image_from_url)

```ruby
KlaviyoAPI::Images.upload_image_from_url(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Images.create_image(body)
```






## Lists


#### [Create List](https://developers.klaviyo.com/en/v2024-10-15/reference/create_list)

```ruby
KlaviyoAPI::Lists.create_list(body)
```





#### [Add Profile To List](https://developers.klaviyo.com/en/v2024-10-15/reference/create_list_relationships)

```ruby
KlaviyoAPI::Lists.create_list_relationships(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Lists.create_list_relationships_profile(id, body)
```





#### [Delete List](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_list)

```ruby
KlaviyoAPI::Lists.delete_list(id)
```





#### [Remove Profile From List](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_list_relationships)

```ruby
KlaviyoAPI::Lists.delete_list_relationships(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Lists.delete_list_relationships_profiles(id, body)
```





#### [Get List](https://developers.klaviyo.com/en/v2024-10-15/reference/get_list)

```ruby
KlaviyoAPI::Lists.get_list(id, opts)
```





#### [Get List Flow Triggers](https://developers.klaviyo.com/en/v2024-10-15/reference/get_list_flow_triggers)

```ruby
KlaviyoAPI::Lists.get_list_flow_triggers(id, opts)
```





#### [Get List Profiles](https://developers.klaviyo.com/en/v2024-10-15/reference/get_list_profiles)

```ruby
KlaviyoAPI::Lists.get_list_profiles(id, opts)
```





#### [Get List Relationships Flow Triggers](https://developers.klaviyo.com/en/v2024-10-15/reference/get_list_relationships_flow_triggers)

```ruby
KlaviyoAPI::Lists.get_list_relationships_flow_triggers(id)
```





#### [Get List Tags](https://developers.klaviyo.com/en/v2024-10-15/reference/get_list_tags)

```ruby
KlaviyoAPI::Lists.get_list_tags(id, opts)
```





#### [Get Lists](https://developers.klaviyo.com/en/v2024-10-15/reference/get_lists)

```ruby
KlaviyoAPI::Lists.get_lists(opts)
```





#### [Get Profile IDs for List](https://developers.klaviyo.com/en/v2024-10-15/reference/get_profile_ids_for_list)

```ruby
KlaviyoAPI::Lists.get_profile_ids_for_list(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Lists.get_list_relationships_profiles(id, opts)
```





#### [Get Tag IDs for List](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag_ids_for_list)

```ruby
KlaviyoAPI::Lists.get_tag_ids_for_list(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Lists.get_list_relationships_tags(id)
```





#### [Update List](https://developers.klaviyo.com/en/v2024-10-15/reference/update_list)

```ruby
KlaviyoAPI::Lists.update_list(id, body)
```






## Metrics


#### [Get Metric](https://developers.klaviyo.com/en/v2024-10-15/reference/get_metric)

```ruby
KlaviyoAPI::Metrics.get_metric(id, opts)
```





#### [Get Metric Flow Triggers](https://developers.klaviyo.com/en/v2024-10-15/reference/get_metric_flow_triggers)

```ruby
KlaviyoAPI::Metrics.get_metric_flow_triggers(id, opts)
```





#### [Get Metric for Metric Property](https://developers.klaviyo.com/en/v2024-10-15/reference/get_metric_for_metric_property)

```ruby
KlaviyoAPI::Metrics.get_metric_for_metric_property(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Metrics.get_metric_property_metric(id, opts)
```





#### [Get Metric ID for Metric Property](https://developers.klaviyo.com/en/v2024-10-15/reference/get_metric_id_for_metric_property)

```ruby
KlaviyoAPI::Metrics.get_metric_id_for_metric_property(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Metrics.get_metric_property_relationships_metric(id)
```





#### [Get Metric Property](https://developers.klaviyo.com/en/v2024-10-15/reference/get_metric_property)

```ruby
KlaviyoAPI::Metrics.get_metric_property(id, opts)
```





#### [Get Metric Relationships Flow Triggers](https://developers.klaviyo.com/en/v2024-10-15/reference/get_metric_relationships_flow_triggers)

```ruby
KlaviyoAPI::Metrics.get_metric_relationships_flow_triggers(id)
```





#### [Get Metrics](https://developers.klaviyo.com/en/v2024-10-15/reference/get_metrics)

```ruby
KlaviyoAPI::Metrics.get_metrics(opts)
```





#### [Get Properties for Metric](https://developers.klaviyo.com/en/v2024-10-15/reference/get_properties_for_metric)

```ruby
KlaviyoAPI::Metrics.get_properties_for_metric(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Metrics.get_metric_metric_properties(id, opts)
```





#### [Get Property IDs for Metric](https://developers.klaviyo.com/en/v2024-10-15/reference/get_property_ids_for_metric)

```ruby
KlaviyoAPI::Metrics.get_property_ids_for_metric(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Metrics.get_metric_relationships_metric_properties(id)
```





#### [Query Metric Aggregates](https://developers.klaviyo.com/en/v2024-10-15/reference/query_metric_aggregates)

```ruby
KlaviyoAPI::Metrics.query_metric_aggregates(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Metrics.create_metric_aggregate(body)
```






## Profiles


#### [Bulk Subscribe Profiles](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_subscribe_profiles)

```ruby
KlaviyoAPI::Profiles.bulk_subscribe_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.subscribe_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.create_profile_subscription_bulk_create_job(body)
```





#### [Bulk Suppress Profiles](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_suppress_profiles)

```ruby
KlaviyoAPI::Profiles.bulk_suppress_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.suppress_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.create_profile_suppression_bulk_create_job(body)
```





#### [Bulk Unsubscribe Profiles](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_unsubscribe_profiles)

```ruby
KlaviyoAPI::Profiles.bulk_unsubscribe_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.unsubscribe_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.create_profile_subscription_bulk_delete_job(body)
```





#### [Bulk Unsuppress Profiles](https://developers.klaviyo.com/en/v2024-10-15/reference/bulk_unsuppress_profiles)

```ruby
KlaviyoAPI::Profiles.bulk_unsuppress_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.unsuppress_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.create_profile_suppression_bulk_delete_job(body)
```





#### [Create or Update Profile](https://developers.klaviyo.com/en/v2024-10-15/reference/create_or_update_profile)

```ruby
KlaviyoAPI::Profiles.create_or_update_profile(body, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.create_profile_import(body, opts)
```





#### [Create Profile](https://developers.klaviyo.com/en/v2024-10-15/reference/create_profile)

```ruby
KlaviyoAPI::Profiles.create_profile(body, opts)
```





#### [Create or Update Push Token](https://developers.klaviyo.com/en/v2024-10-15/reference/create_push_token)

```ruby
KlaviyoAPI::Profiles.create_push_token(body)
```





#### [Get Bulk Import Profiles Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_import_profiles_job)

```ruby
KlaviyoAPI::Profiles.get_bulk_import_profiles_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_bulk_import_job(job_id, opts)
```





#### [Get Bulk Import Profiles Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_import_profiles_jobs)

```ruby
KlaviyoAPI::Profiles.get_bulk_import_profiles_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_bulk_import_jobs(opts)
```





#### [Get Bulk Suppress Profiles Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_suppress_profiles_job)

```ruby
KlaviyoAPI::Profiles.get_bulk_suppress_profiles_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_suppression_bulk_create_job(job_id, opts)
```





#### [Get Bulk Suppress Profiles Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_suppress_profiles_jobs)

```ruby
KlaviyoAPI::Profiles.get_bulk_suppress_profiles_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_suppression_bulk_create_jobs(opts)
```





#### [Get Bulk Unsuppress Profiles Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_unsuppress_profiles_job)

```ruby
KlaviyoAPI::Profiles.get_bulk_unsuppress_profiles_job(job_id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_suppression_bulk_delete_job(job_id, opts)
```





#### [Get Bulk Unsuppress Profiles Jobs](https://developers.klaviyo.com/en/v2024-10-15/reference/get_bulk_unsuppress_profiles_jobs)

```ruby
KlaviyoAPI::Profiles.get_bulk_unsuppress_profiles_jobs(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_suppression_bulk_delete_jobs(opts)
```





#### [Get Errors for Bulk Import Profiles Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_errors_for_bulk_import_profiles_job)

```ruby
KlaviyoAPI::Profiles.get_errors_for_bulk_import_profiles_job(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_import_errors(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_bulk_import_job_import_errors(id, opts)
```





#### [Get List for Bulk Import Profiles Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_list_for_bulk_import_profiles_job)

```ruby
KlaviyoAPI::Profiles.get_list_for_bulk_import_profiles_job(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_lists(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_bulk_import_job_lists(id, opts)
```





#### [Get List IDs for Bulk Import Profiles Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_list_ids_for_bulk_import_profiles_job)

```ruby
KlaviyoAPI::Profiles.get_list_ids_for_bulk_import_profiles_job(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_relationships_lists(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_bulk_import_job_relationships_lists(id)
```





#### [Get List IDs for Profile](https://developers.klaviyo.com/en/v2024-10-15/reference/get_list_ids_for_profile)

```ruby
KlaviyoAPI::Profiles.get_list_ids_for_profile(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_relationships_lists(id)
```





#### [Get Lists for Profile](https://developers.klaviyo.com/en/v2024-10-15/reference/get_lists_for_profile)

```ruby
KlaviyoAPI::Profiles.get_lists_for_profile(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_lists(id, opts)
```





#### [Get Profile](https://developers.klaviyo.com/en/v2024-10-15/reference/get_profile)

```ruby
KlaviyoAPI::Profiles.get_profile(id, opts)
```





#### [Get Profile IDs for Bulk Import Profiles Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_profile_ids_for_bulk_import_profiles_job)

```ruby
KlaviyoAPI::Profiles.get_profile_ids_for_bulk_import_profiles_job(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_relationships_profiles(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_bulk_import_job_relationships_profiles(id, opts)
```





#### [Get Profiles](https://developers.klaviyo.com/en/v2024-10-15/reference/get_profiles)

```ruby
KlaviyoAPI::Profiles.get_profiles(opts)
```





#### [Get Profiles for Bulk Import Profiles Job](https://developers.klaviyo.com/en/v2024-10-15/reference/get_profiles_for_bulk_import_profiles_job)

```ruby
KlaviyoAPI::Profiles.get_profiles_for_bulk_import_profiles_job(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_profiles(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_bulk_import_job_profiles(id, opts)
```





#### [Get Segment IDs for Profile](https://developers.klaviyo.com/en/v2024-10-15/reference/get_segment_ids_for_profile)

```ruby
KlaviyoAPI::Profiles.get_segment_ids_for_profile(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_relationships_segments(id)
```





#### [Get Segments for Profile](https://developers.klaviyo.com/en/v2024-10-15/reference/get_segments_for_profile)

```ruby
KlaviyoAPI::Profiles.get_segments_for_profile(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.get_profile_segments(id, opts)
```





#### [Merge Profiles](https://developers.klaviyo.com/en/v2024-10-15/reference/merge_profiles)

```ruby
KlaviyoAPI::Profiles.merge_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.create_profile_merge(body)
```





#### [Spawn Bulk Profile Import Job](https://developers.klaviyo.com/en/v2024-10-15/reference/spawn_bulk_profile_import_job)

```ruby
KlaviyoAPI::Profiles.spawn_bulk_profile_import_job(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.bulk_import_profiles(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Profiles.create_profile_bulk_import_job(body)
```





#### [Update Profile](https://developers.klaviyo.com/en/v2024-10-15/reference/update_profile)

```ruby
KlaviyoAPI::Profiles.update_profile(id, body, opts)
```






## Reporting


#### [Query Campaign Values](https://developers.klaviyo.com/en/v2024-10-15/reference/query_campaign_values)

```ruby
KlaviyoAPI::Reporting.query_campaign_values(body, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Reporting.create_campaign_value_report(body, opts)
```





#### [Query Flow Series](https://developers.klaviyo.com/en/v2024-10-15/reference/query_flow_series)

```ruby
KlaviyoAPI::Reporting.query_flow_series(body, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Reporting.create_flow_sery_report(body, opts)
```





#### [Query Flow Values](https://developers.klaviyo.com/en/v2024-10-15/reference/query_flow_values)

```ruby
KlaviyoAPI::Reporting.query_flow_values(body, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Reporting.create_flow_value_report(body, opts)
```





#### [Query Form Series](https://developers.klaviyo.com/en/v2024-10-15/reference/query_form_series)

```ruby
KlaviyoAPI::Reporting.query_form_series(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Reporting.create_form_sery_report(body)
```





#### [Query Form Values](https://developers.klaviyo.com/en/v2024-10-15/reference/query_form_values)

```ruby
KlaviyoAPI::Reporting.query_form_values(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Reporting.create_form_value_report(body)
```





#### [Query Segment Series](https://developers.klaviyo.com/en/v2024-10-15/reference/query_segment_series)

```ruby
KlaviyoAPI::Reporting.query_segment_series(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Reporting.create_segment_sery_report(body)
```





#### [Query Segment Values](https://developers.klaviyo.com/en/v2024-10-15/reference/query_segment_values)

```ruby
KlaviyoAPI::Reporting.query_segment_values(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Reporting.create_segment_value_report(body)
```






## Reviews


#### [Get Review](https://developers.klaviyo.com/en/v2024-10-15/reference/get_review)

```ruby
KlaviyoAPI::Reviews.get_review(id, opts)
```





#### [Get Reviews](https://developers.klaviyo.com/en/v2024-10-15/reference/get_reviews)

```ruby
KlaviyoAPI::Reviews.get_reviews(opts)
```






## Segments


#### [Create Segment](https://developers.klaviyo.com/en/v2024-10-15/reference/create_segment)

```ruby
KlaviyoAPI::Segments.create_segment(body)
```





#### [Delete Segment](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_segment)

```ruby
KlaviyoAPI::Segments.delete_segment(id)
```





#### [Get Profile IDs for Segment](https://developers.klaviyo.com/en/v2024-10-15/reference/get_profile_ids_for_segment)

```ruby
KlaviyoAPI::Segments.get_profile_ids_for_segment(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Segments.get_segment_relationships_profiles(id, opts)
```





#### [Get Profiles for Segment](https://developers.klaviyo.com/en/v2024-10-15/reference/get_profiles_for_segment)

```ruby
KlaviyoAPI::Segments.get_profiles_for_segment(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Segments.get_segment_profiles(id, opts)
```





#### [Get Segment](https://developers.klaviyo.com/en/v2024-10-15/reference/get_segment)

```ruby
KlaviyoAPI::Segments.get_segment(id, opts)
```





#### [Get Segment Flow Triggers](https://developers.klaviyo.com/en/v2024-10-15/reference/get_segment_flow_triggers)

```ruby
KlaviyoAPI::Segments.get_segment_flow_triggers(id, opts)
```





#### [Get Segment Relationships Flow Triggers](https://developers.klaviyo.com/en/v2024-10-15/reference/get_segment_relationships_flow_triggers)

```ruby
KlaviyoAPI::Segments.get_segment_relationships_flow_triggers(id)
```





#### [Get Segments](https://developers.klaviyo.com/en/v2024-10-15/reference/get_segments)

```ruby
KlaviyoAPI::Segments.get_segments(opts)
```





#### [Get Tag IDs for Segment](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag_ids_for_segment)

```ruby
KlaviyoAPI::Segments.get_tag_ids_for_segment(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Segments.get_segment_relationships_tags(id)
```





#### [Get Tags for Segment](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tags_for_segment)

```ruby
KlaviyoAPI::Segments.get_tags_for_segment(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Segments.get_segment_tags(id, opts)
```





#### [Update Segment](https://developers.klaviyo.com/en/v2024-10-15/reference/update_segment)

```ruby
KlaviyoAPI::Segments.update_segment(id, body)
```






## Tags


#### [Create Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/create_tag)

```ruby
KlaviyoAPI::Tags.create_tag(body)
```





#### [Create Tag Group](https://developers.klaviyo.com/en/v2024-10-15/reference/create_tag_group)

```ruby
KlaviyoAPI::Tags.create_tag_group(body)
```





#### [Delete Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_tag)

```ruby
KlaviyoAPI::Tags.delete_tag(id)
```





#### [Delete Tag Group](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_tag_group)

```ruby
KlaviyoAPI::Tags.delete_tag_group(id)
```





#### [Get Campaign IDs for Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/get_campaign_ids_for_tag)

```ruby
KlaviyoAPI::Tags.get_campaign_ids_for_tag(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.get_tag_relationships_campaigns(id)
```





#### [Get Flow IDs for Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/get_flow_ids_for_tag)

```ruby
KlaviyoAPI::Tags.get_flow_ids_for_tag(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.get_tag_relationships_flows(id)
```





#### [Get List IDs for Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/get_list_ids_for_tag)

```ruby
KlaviyoAPI::Tags.get_list_ids_for_tag(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.get_tag_relationships_lists(id)
```





#### [Get Segment IDs for Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/get_segment_ids_for_tag)

```ruby
KlaviyoAPI::Tags.get_segment_ids_for_tag(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.get_tag_relationships_segments(id)
```





#### [Get Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag)

```ruby
KlaviyoAPI::Tags.get_tag(id, opts)
```





#### [Get Tag Group](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag_group)

```ruby
KlaviyoAPI::Tags.get_tag_group(id, opts)
```





#### [Get Tag Group for Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag_group_for_tag)

```ruby
KlaviyoAPI::Tags.get_tag_group_for_tag(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.get_tag_tag_group(id, opts)
```





#### [Get Tag Group ID for Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag_group_id_for_tag)

```ruby
KlaviyoAPI::Tags.get_tag_group_id_for_tag(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.get_tag_relationships_tag_group(id)
```





#### [Get Tag Groups](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag_groups)

```ruby
KlaviyoAPI::Tags.get_tag_groups(opts)
```





#### [Get Tag IDs for Tag Group](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tag_ids_for_tag_group)

```ruby
KlaviyoAPI::Tags.get_tag_ids_for_tag_group(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.get_tag_group_relationships_tags(id)
```





#### [Get Tags](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tags)

```ruby
KlaviyoAPI::Tags.get_tags(opts)
```





#### [Get Tags for Tag Group](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tags_for_tag_group)

```ruby
KlaviyoAPI::Tags.get_tags_for_tag_group(id, opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.get_tag_group_tags(id, opts)
```





#### [Remove Tag from Campaigns](https://developers.klaviyo.com/en/v2024-10-15/reference/remove_tag_from_campaigns)

```ruby
KlaviyoAPI::Tags.remove_tag_from_campaigns(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.delete_tag_relationships_campaigns(id, body)
```





#### [Remove Tag from Flows](https://developers.klaviyo.com/en/v2024-10-15/reference/remove_tag_from_flows)

```ruby
KlaviyoAPI::Tags.remove_tag_from_flows(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.delete_tag_relationships_flows(id, body)
```





#### [Remove Tag from Lists](https://developers.klaviyo.com/en/v2024-10-15/reference/remove_tag_from_lists)

```ruby
KlaviyoAPI::Tags.remove_tag_from_lists(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.delete_tag_relationships_lists(id, body)
```





#### [Remove Tag from Segments](https://developers.klaviyo.com/en/v2024-10-15/reference/remove_tag_from_segments)

```ruby
KlaviyoAPI::Tags.remove_tag_from_segments(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.delete_tag_relationships_segments(id, body)
```





#### [Tag Campaigns](https://developers.klaviyo.com/en/v2024-10-15/reference/tag_campaigns)

```ruby
KlaviyoAPI::Tags.tag_campaigns(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.create_tag_relationships_campaigns(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.create_tag_relationships_campaign(id, body)
```





#### [Tag Flows](https://developers.klaviyo.com/en/v2024-10-15/reference/tag_flows)

```ruby
KlaviyoAPI::Tags.tag_flows(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.create_tag_relationships_flows(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.create_tag_relationships_flow(id, body)
```





#### [Tag Lists](https://developers.klaviyo.com/en/v2024-10-15/reference/tag_lists)

```ruby
KlaviyoAPI::Tags.tag_lists(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.create_tag_relationships_lists(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.create_tag_relationships_list(id, body)
```





#### [Tag Segments](https://developers.klaviyo.com/en/v2024-10-15/reference/tag_segments)

```ruby
KlaviyoAPI::Tags.tag_segments(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.create_tag_relationships_segments(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Tags.create_tag_relationships_segment(id, body)
```





#### [Update Tag](https://developers.klaviyo.com/en/v2024-10-15/reference/update_tag)

```ruby
KlaviyoAPI::Tags.update_tag(id, body)
```





#### [Update Tag Group](https://developers.klaviyo.com/en/v2024-10-15/reference/update_tag_group)

```ruby
KlaviyoAPI::Tags.update_tag_group(id, body)
```






## Templates


#### [Clone Template](https://developers.klaviyo.com/en/v2024-10-15/reference/clone_template)

```ruby
KlaviyoAPI::Templates.clone_template(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Templates.create_template_clone(body)
```





#### [Create Template](https://developers.klaviyo.com/en/v2024-10-15/reference/create_template)

```ruby
KlaviyoAPI::Templates.create_template(body)
```





#### [Create Universal Content](https://developers.klaviyo.com/en/v2024-10-15/reference/create_universal_content)

```ruby
KlaviyoAPI::Templates.create_universal_content(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Templates.create_template_universal_content(body)
```





#### [Delete Template](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_template)

```ruby
KlaviyoAPI::Templates.delete_template(id)
```





#### [Delete Universal Content](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_universal_content)

```ruby
KlaviyoAPI::Templates.delete_universal_content(id)
```
##### Method alias:
```ruby
KlaviyoAPI::Templates.delete_template_universal_content(id)
```





#### [Get All Universal Content](https://developers.klaviyo.com/en/v2024-10-15/reference/get_all_universal_content)

```ruby
KlaviyoAPI::Templates.get_all_universal_content(opts)
```
##### Method alias:
```ruby
KlaviyoAPI::Templates.get_template_universal_content(opts)
```





#### [Get Template](https://developers.klaviyo.com/en/v2024-10-15/reference/get_template)

```ruby
KlaviyoAPI::Templates.get_template(id, opts)
```





#### [Get Templates](https://developers.klaviyo.com/en/v2024-10-15/reference/get_templates)

```ruby
KlaviyoAPI::Templates.get_templates(opts)
```





#### [Get Universal Content](https://developers.klaviyo.com/en/v2024-10-15/reference/get_universal_content)

```ruby
KlaviyoAPI::Templates.get_universal_content(id, opts)
```





#### [Render Template](https://developers.klaviyo.com/en/v2024-10-15/reference/render_template)

```ruby
KlaviyoAPI::Templates.render_template(body)
```
##### Method alias:
```ruby
KlaviyoAPI::Templates.create_template_render(body)
```





#### [Update Template](https://developers.klaviyo.com/en/v2024-10-15/reference/update_template)

```ruby
KlaviyoAPI::Templates.update_template(id, body)
```





#### [Update Universal Content](https://developers.klaviyo.com/en/v2024-10-15/reference/update_universal_content)

```ruby
KlaviyoAPI::Templates.update_universal_content(id, body)
```
##### Method alias:
```ruby
KlaviyoAPI::Templates.update_template_universal_content(id, body)
```






## Tracking Settings


#### [Get Tracking Setting](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tracking_setting)

```ruby
KlaviyoAPI::TrackingSettings.get_tracking_setting(id, opts)
```





#### [Get Tracking Settings](https://developers.klaviyo.com/en/v2024-10-15/reference/get_tracking_settings)

```ruby
KlaviyoAPI::TrackingSettings.get_tracking_settings(opts)
```





#### [Update Tracking Setting](https://developers.klaviyo.com/en/v2024-10-15/reference/update_tracking_setting)

```ruby
KlaviyoAPI::TrackingSettings.update_tracking_setting(id, body)
```






## Webhooks


#### [Create Webhook](https://developers.klaviyo.com/en/v2024-10-15/reference/create_webhook)

```ruby
KlaviyoAPI::Webhooks.create_webhook(body)
```





#### [Delete Webhook](https://developers.klaviyo.com/en/v2024-10-15/reference/delete_webhook)

```ruby
KlaviyoAPI::Webhooks.delete_webhook(id)
```





#### [Get Webhook](https://developers.klaviyo.com/en/v2024-10-15/reference/get_webhook)

```ruby
KlaviyoAPI::Webhooks.get_webhook(id, opts)
```





#### [Get Webhook Topic](https://developers.klaviyo.com/en/v2024-10-15/reference/get_webhook_topic)

```ruby
KlaviyoAPI::Webhooks.get_webhook_topic(id)
```





#### [Get Webhook Topics](https://developers.klaviyo.com/en/v2024-10-15/reference/get_webhook_topics)

```ruby
KlaviyoAPI::Webhooks.get_webhook_topics
```





#### [Get Webhooks](https://developers.klaviyo.com/en/v2024-10-15/reference/get_webhooks)

```ruby
KlaviyoAPI::Webhooks.get_webhooks(opts)
```





#### [Update Webhook](https://developers.klaviyo.com/en/v2024-10-15/reference/update_webhook)

```ruby
KlaviyoAPI::Webhooks.update_webhook(id, body)
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
