# Klaviyo Ruby SDK

- SDK version: 8.0.0
- API revision: 2024-07-15

## Helpful Resources

- [API Reference](https://developers.klaviyo.com/en/v2024-07-15/reference)
- [API Guides](https://developers.klaviyo.com/en/v2024-07-15/docs)
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



- Segments



- Tags



- Templates



- Webhooks




## Installation


### Build

To build the Ruby code into a gem:

```shell
gem build klaviyo-api-sdk.gemspec
```

Then install the gem locally:

```shell
gem install ./klaviyo-api-sdk-8.0.0.gem
```


Finally add this to the Gemfile:

    gem 'klaviyo-api-sdk', '~> 8.0.0'

To install directly from rubygems:

```shell
gem install klaviyo-api-sdk
```

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
- Organization: Resource groups and operation_ids are listed in alphabetical order, first by Resource name, then by **OpenAPI Summary**. Operation summaries are those listed in the right side bar of the [API Reference](https://developers.klaviyo.com/en/v2024-07-15/reference/get_events).
- For example values / data types, as well as whether parameters are required/optional, please reference the corresponding API Reference link.
- Some args are required for the API call to succeed, the API docs above are the source of truth regarding which params are required.






## Accounts


#### [Get Account](https://developers.klaviyo.com/en/v2024-07-15/reference/get_account)

```ruby
KlaviyoAPI::Accounts.get_account(id, opts)
```





#### [Get Accounts](https://developers.klaviyo.com/en/v2024-07-15/reference/get_accounts)

```ruby
KlaviyoAPI::Accounts.get_accounts(opts)
```






## Campaigns


#### [Create Campaign](https://developers.klaviyo.com/en/v2024-07-15/reference/create_campaign)

```ruby
KlaviyoAPI::Campaigns.create_campaign(body)
```





#### [Create Campaign Clone](https://developers.klaviyo.com/en/v2024-07-15/reference/create_campaign_clone)

```ruby
KlaviyoAPI::Campaigns.create_campaign_clone(body)
```





#### [Assign Campaign Message Template](https://developers.klaviyo.com/en/v2024-07-15/reference/create_campaign_message_assign_template)

```ruby
KlaviyoAPI::Campaigns.create_campaign_message_assign_template(body)
```





#### [Create Campaign Recipient Estimation Job](https://developers.klaviyo.com/en/v2024-07-15/reference/create_campaign_recipient_estimation_job)

```ruby
KlaviyoAPI::Campaigns.create_campaign_recipient_estimation_job(body)
```





#### [Create Campaign Send Job](https://developers.klaviyo.com/en/v2024-07-15/reference/create_campaign_send_job)

```ruby
KlaviyoAPI::Campaigns.create_campaign_send_job(body)
```





#### [Delete Campaign](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_campaign)

```ruby
KlaviyoAPI::Campaigns.delete_campaign(id)
```





#### [Get Campaign](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign)

```ruby
KlaviyoAPI::Campaigns.get_campaign(id, opts)
```





#### [Get Campaign Campaign Messages](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_campaign_messages)

```ruby
KlaviyoAPI::Campaigns.get_campaign_campaign_messages(id, opts)
```





#### [Get Campaign Message](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_message)

```ruby
KlaviyoAPI::Campaigns.get_campaign_message(id, opts)
```





#### [Get Campaign Message Campaign](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_message_campaign)

```ruby
KlaviyoAPI::Campaigns.get_campaign_message_campaign(id, opts)
```





#### [Get Campaign Message Relationships Campaign](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_message_relationships_campaign)

```ruby
KlaviyoAPI::Campaigns.get_campaign_message_relationships_campaign(id)
```





#### [Get Campaign Message Relationships Template](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_message_relationships_template)

```ruby
KlaviyoAPI::Campaigns.get_campaign_message_relationships_template(id)
```





#### [Get Campaign Message Template](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_message_template)

```ruby
KlaviyoAPI::Campaigns.get_campaign_message_template(id, opts)
```





#### [Get Campaign Recipient Estimation](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_recipient_estimation)

```ruby
KlaviyoAPI::Campaigns.get_campaign_recipient_estimation(id, opts)
```





#### [Get Campaign Recipient Estimation Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_recipient_estimation_job)

```ruby
KlaviyoAPI::Campaigns.get_campaign_recipient_estimation_job(id, opts)
```





#### [Get Campaign Relationships Campaign Messages](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_relationships_campaign_messages)

```ruby
KlaviyoAPI::Campaigns.get_campaign_relationships_campaign_messages(id)
```





#### [Get Campaign Relationships Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_relationships_tags)

```ruby
KlaviyoAPI::Campaigns.get_campaign_relationships_tags(id)
```





#### [Get Campaign Send Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_send_job)

```ruby
KlaviyoAPI::Campaigns.get_campaign_send_job(id, opts)
```





#### [Get Campaign Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaign_tags)

```ruby
KlaviyoAPI::Campaigns.get_campaign_tags(id, opts)
```





#### [Get Campaigns](https://developers.klaviyo.com/en/v2024-07-15/reference/get_campaigns)

```ruby
KlaviyoAPI::Campaigns.get_campaigns(filter, opts)
```





#### [Update Campaign](https://developers.klaviyo.com/en/v2024-07-15/reference/update_campaign)

```ruby
KlaviyoAPI::Campaigns.update_campaign(id, body)
```





#### [Update Campaign Message](https://developers.klaviyo.com/en/v2024-07-15/reference/update_campaign_message)

```ruby
KlaviyoAPI::Campaigns.update_campaign_message(id, body)
```





#### [Update Campaign Send Job](https://developers.klaviyo.com/en/v2024-07-15/reference/update_campaign_send_job)

```ruby
KlaviyoAPI::Campaigns.update_campaign_send_job(id, body)
```






## Catalogs


#### [Create Back In Stock Subscription](https://developers.klaviyo.com/en/v2024-07-15/reference/create_back_in_stock_subscription)

```ruby
KlaviyoAPI::Catalogs.create_back_in_stock_subscription(body)
```





#### [Create Catalog Category](https://developers.klaviyo.com/en/v2024-07-15/reference/create_catalog_category)

```ruby
KlaviyoAPI::Catalogs.create_catalog_category(body)
```





#### [Create Catalog Category Relationships Items](https://developers.klaviyo.com/en/v2024-07-15/reference/create_catalog_category_relationships_items)

```ruby
KlaviyoAPI::Catalogs.create_catalog_category_relationships_items(id, body)
```





#### [Create Catalog Item](https://developers.klaviyo.com/en/v2024-07-15/reference/create_catalog_item)

```ruby
KlaviyoAPI::Catalogs.create_catalog_item(body)
```





#### [Create Catalog Item Relationships Categories](https://developers.klaviyo.com/en/v2024-07-15/reference/create_catalog_item_relationships_categories)

```ruby
KlaviyoAPI::Catalogs.create_catalog_item_relationships_categories(id, body)
```





#### [Create Catalog Variant](https://developers.klaviyo.com/en/v2024-07-15/reference/create_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.create_catalog_variant(body)
```





#### [Delete Catalog Category](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_catalog_category)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_category(id)
```





#### [Delete Catalog Category Relationships Items](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_catalog_category_relationships_items)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_category_relationships_items(id, body)
```





#### [Delete Catalog Item](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_catalog_item)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_item(id)
```





#### [Delete Catalog Item Relationships Categories](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_catalog_item_relationships_categories)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_item_relationships_categories(id, body)
```





#### [Delete Catalog Variant](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.delete_catalog_variant(id)
```





#### [Get Catalog Categories](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_categories)

```ruby
KlaviyoAPI::Catalogs.get_catalog_categories(opts)
```





#### [Get Catalog Category](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_category)

```ruby
KlaviyoAPI::Catalogs.get_catalog_category(id, opts)
```





#### [Get Catalog Category Items](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_category_items)

```ruby
KlaviyoAPI::Catalogs.get_catalog_category_items(id, opts)
```





#### [Get Catalog Category Relationships Items](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_category_relationships_items)

```ruby
KlaviyoAPI::Catalogs.get_catalog_category_relationships_items(id, opts)
```





#### [Get Catalog Item](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_item)

```ruby
KlaviyoAPI::Catalogs.get_catalog_item(id, opts)
```





#### [Get Catalog Item Categories](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_item_categories)

```ruby
KlaviyoAPI::Catalogs.get_catalog_item_categories(id, opts)
```





#### [Get Catalog Item Relationships Categories](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_item_relationships_categories)

```ruby
KlaviyoAPI::Catalogs.get_catalog_item_relationships_categories(id, opts)
```





#### [Get Catalog Item Variants](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_item_variants)

```ruby
KlaviyoAPI::Catalogs.get_catalog_item_variants(id, opts)
```





#### [Get Catalog Items](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_items)

```ruby
KlaviyoAPI::Catalogs.get_catalog_items(opts)
```





#### [Get Catalog Variant](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.get_catalog_variant(id, opts)
```





#### [Get Catalog Variants](https://developers.klaviyo.com/en/v2024-07-15/reference/get_catalog_variants)

```ruby
KlaviyoAPI::Catalogs.get_catalog_variants(opts)
```





#### [Get Create Categories Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_create_categories_job)

```ruby
KlaviyoAPI::Catalogs.get_create_categories_job(job_id, opts)
```





#### [Get Create Categories Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_create_categories_jobs)

```ruby
KlaviyoAPI::Catalogs.get_create_categories_jobs(opts)
```





#### [Get Create Items Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_create_items_job)

```ruby
KlaviyoAPI::Catalogs.get_create_items_job(job_id, opts)
```





#### [Get Create Items Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_create_items_jobs)

```ruby
KlaviyoAPI::Catalogs.get_create_items_jobs(opts)
```





#### [Get Create Variants Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_create_variants_job)

```ruby
KlaviyoAPI::Catalogs.get_create_variants_job(job_id, opts)
```





#### [Get Create Variants Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_create_variants_jobs)

```ruby
KlaviyoAPI::Catalogs.get_create_variants_jobs(opts)
```





#### [Get Delete Categories Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_delete_categories_job)

```ruby
KlaviyoAPI::Catalogs.get_delete_categories_job(job_id, opts)
```





#### [Get Delete Categories Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_delete_categories_jobs)

```ruby
KlaviyoAPI::Catalogs.get_delete_categories_jobs(opts)
```





#### [Get Delete Items Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_delete_items_job)

```ruby
KlaviyoAPI::Catalogs.get_delete_items_job(job_id, opts)
```





#### [Get Delete Items Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_delete_items_jobs)

```ruby
KlaviyoAPI::Catalogs.get_delete_items_jobs(opts)
```





#### [Get Delete Variants Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_delete_variants_job)

```ruby
KlaviyoAPI::Catalogs.get_delete_variants_job(job_id, opts)
```





#### [Get Delete Variants Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_delete_variants_jobs)

```ruby
KlaviyoAPI::Catalogs.get_delete_variants_jobs(opts)
```





#### [Get Update Categories Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_update_categories_job)

```ruby
KlaviyoAPI::Catalogs.get_update_categories_job(job_id, opts)
```





#### [Get Update Categories Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_update_categories_jobs)

```ruby
KlaviyoAPI::Catalogs.get_update_categories_jobs(opts)
```





#### [Get Update Items Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_update_items_job)

```ruby
KlaviyoAPI::Catalogs.get_update_items_job(job_id, opts)
```





#### [Get Update Items Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_update_items_jobs)

```ruby
KlaviyoAPI::Catalogs.get_update_items_jobs(opts)
```





#### [Get Update Variants Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_update_variants_job)

```ruby
KlaviyoAPI::Catalogs.get_update_variants_job(job_id, opts)
```





#### [Get Update Variants Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_update_variants_jobs)

```ruby
KlaviyoAPI::Catalogs.get_update_variants_jobs(opts)
```





#### [Spawn Create Categories Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_create_categories_job)

```ruby
KlaviyoAPI::Catalogs.spawn_create_categories_job(body)
```





#### [Spawn Create Items Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_create_items_job)

```ruby
KlaviyoAPI::Catalogs.spawn_create_items_job(body)
```





#### [Spawn Create Variants Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_create_variants_job)

```ruby
KlaviyoAPI::Catalogs.spawn_create_variants_job(body)
```





#### [Spawn Delete Categories Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_delete_categories_job)

```ruby
KlaviyoAPI::Catalogs.spawn_delete_categories_job(body)
```





#### [Spawn Delete Items Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_delete_items_job)

```ruby
KlaviyoAPI::Catalogs.spawn_delete_items_job(body)
```





#### [Spawn Delete Variants Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_delete_variants_job)

```ruby
KlaviyoAPI::Catalogs.spawn_delete_variants_job(body)
```





#### [Spawn Update Categories Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_update_categories_job)

```ruby
KlaviyoAPI::Catalogs.spawn_update_categories_job(body)
```





#### [Spawn Update Items Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_update_items_job)

```ruby
KlaviyoAPI::Catalogs.spawn_update_items_job(body)
```





#### [Spawn Update Variants Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_update_variants_job)

```ruby
KlaviyoAPI::Catalogs.spawn_update_variants_job(body)
```





#### [Update Catalog Category](https://developers.klaviyo.com/en/v2024-07-15/reference/update_catalog_category)

```ruby
KlaviyoAPI::Catalogs.update_catalog_category(id, body)
```





#### [Update Catalog Category Relationships Items](https://developers.klaviyo.com/en/v2024-07-15/reference/update_catalog_category_relationships_items)

```ruby
KlaviyoAPI::Catalogs.update_catalog_category_relationships_items(id, body)
```





#### [Update Catalog Item](https://developers.klaviyo.com/en/v2024-07-15/reference/update_catalog_item)

```ruby
KlaviyoAPI::Catalogs.update_catalog_item(id, body)
```





#### [Update Catalog Item Relationships Categories](https://developers.klaviyo.com/en/v2024-07-15/reference/update_catalog_item_relationships_categories)

```ruby
KlaviyoAPI::Catalogs.update_catalog_item_relationships_categories(id, body)
```





#### [Update Catalog Variant](https://developers.klaviyo.com/en/v2024-07-15/reference/update_catalog_variant)

```ruby
KlaviyoAPI::Catalogs.update_catalog_variant(id, body)
```






## Coupons


#### [Create Coupon](https://developers.klaviyo.com/en/v2024-07-15/reference/create_coupon)

```ruby
KlaviyoAPI::Coupons.create_coupon(body)
```





#### [Create Coupon Code](https://developers.klaviyo.com/en/v2024-07-15/reference/create_coupon_code)

```ruby
KlaviyoAPI::Coupons.create_coupon_code(body)
```





#### [Delete Coupon](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_coupon)

```ruby
KlaviyoAPI::Coupons.delete_coupon(id)
```





#### [Delete Coupon Code](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_coupon_code)

```ruby
KlaviyoAPI::Coupons.delete_coupon_code(id)
```





#### [Get Coupon](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupon)

```ruby
KlaviyoAPI::Coupons.get_coupon(id, opts)
```





#### [Get Coupon Code](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupon_code)

```ruby
KlaviyoAPI::Coupons.get_coupon_code(id, opts)
```





#### [Get Coupon Code Bulk Create Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupon_code_bulk_create_job)

```ruby
KlaviyoAPI::Coupons.get_coupon_code_bulk_create_job(job_id, opts)
```





#### [Get Coupon Code Bulk Create Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupon_code_bulk_create_jobs)

```ruby
KlaviyoAPI::Coupons.get_coupon_code_bulk_create_jobs(opts)
```





#### [Get Coupon Code Relationships Coupon](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupon_code_relationships_coupon)

```ruby
KlaviyoAPI::Coupons.get_coupon_code_relationships_coupon(id, opts)
```





#### [Get Coupon Codes](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupon_codes)

```ruby
KlaviyoAPI::Coupons.get_coupon_codes(opts)
```





#### [Get Coupon Codes For Coupon](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupon_codes_for_coupon)

```ruby
KlaviyoAPI::Coupons.get_coupon_codes_for_coupon(id, opts)
```





#### [Get Coupon For Coupon Code](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupon_for_coupon_code)

```ruby
KlaviyoAPI::Coupons.get_coupon_for_coupon_code(id, opts)
```





#### [Get Coupon Relationships Coupon Codes](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupon_relationships_coupon_codes)

```ruby
KlaviyoAPI::Coupons.get_coupon_relationships_coupon_codes(id)
```





#### [Get Coupons](https://developers.klaviyo.com/en/v2024-07-15/reference/get_coupons)

```ruby
KlaviyoAPI::Coupons.get_coupons(opts)
```





#### [Spawn Coupon Code Bulk Create Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_coupon_code_bulk_create_job)

```ruby
KlaviyoAPI::Coupons.spawn_coupon_code_bulk_create_job(body)
```





#### [Update Coupon](https://developers.klaviyo.com/en/v2024-07-15/reference/update_coupon)

```ruby
KlaviyoAPI::Coupons.update_coupon(id, body)
```





#### [Update Coupon Code](https://developers.klaviyo.com/en/v2024-07-15/reference/update_coupon_code)

```ruby
KlaviyoAPI::Coupons.update_coupon_code(id, body)
```






## Data Privacy


#### [Request Profile Deletion](https://developers.klaviyo.com/en/v2024-07-15/reference/request_profile_deletion)

```ruby
KlaviyoAPI::DataPrivacy.request_profile_deletion(body)
```






## Events


#### [Bulk Create Events](https://developers.klaviyo.com/en/v2024-07-15/reference/bulk_create_events)

```ruby
KlaviyoAPI::Events.bulk_create_events(body)
```





#### [Create Event](https://developers.klaviyo.com/en/v2024-07-15/reference/create_event)

```ruby
KlaviyoAPI::Events.create_event(body)
```





#### [Get Event](https://developers.klaviyo.com/en/v2024-07-15/reference/get_event)

```ruby
KlaviyoAPI::Events.get_event(id, opts)
```





#### [Get Event Metric](https://developers.klaviyo.com/en/v2024-07-15/reference/get_event_metric)

```ruby
KlaviyoAPI::Events.get_event_metric(id, opts)
```





#### [Get Event Profile](https://developers.klaviyo.com/en/v2024-07-15/reference/get_event_profile)

```ruby
KlaviyoAPI::Events.get_event_profile(id, opts)
```





#### [Get Event Relationships Metric](https://developers.klaviyo.com/en/v2024-07-15/reference/get_event_relationships_metric)

```ruby
KlaviyoAPI::Events.get_event_relationships_metric(id)
```





#### [Get Event Relationships Profile](https://developers.klaviyo.com/en/v2024-07-15/reference/get_event_relationships_profile)

```ruby
KlaviyoAPI::Events.get_event_relationships_profile(id)
```





#### [Get Events](https://developers.klaviyo.com/en/v2024-07-15/reference/get_events)

```ruby
KlaviyoAPI::Events.get_events(opts)
```






## Flows


#### [Delete Flow](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_flow)

```ruby
KlaviyoAPI::Flows.delete_flow(id)
```





#### [Get Flow](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow)

```ruby
KlaviyoAPI::Flows.get_flow(id, opts)
```





#### [Get Flow Action](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_action)

```ruby
KlaviyoAPI::Flows.get_flow_action(id, opts)
```





#### [Get Flow For Flow Action](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_action_flow)

```ruby
KlaviyoAPI::Flows.get_flow_action_flow(id, opts)
```





#### [Get Flow Action Messages](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_action_messages)

```ruby
KlaviyoAPI::Flows.get_flow_action_messages(id, opts)
```





#### [Get Flow Action Relationships Flow](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_action_relationships_flow)

```ruby
KlaviyoAPI::Flows.get_flow_action_relationships_flow(id)
```





#### [Get Flow Action Relationships Messages](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_action_relationships_messages)

```ruby
KlaviyoAPI::Flows.get_flow_action_relationships_messages(id, opts)
```





#### [Get Flow Flow Actions](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_flow_actions)

```ruby
KlaviyoAPI::Flows.get_flow_flow_actions(id, opts)
```





#### [Get Flow Message](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_message)

```ruby
KlaviyoAPI::Flows.get_flow_message(id, opts)
```





#### [Get Flow Action For Message](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_message_action)

```ruby
KlaviyoAPI::Flows.get_flow_message_action(id, opts)
```





#### [Get Flow Message Relationships Action](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_message_relationships_action)

```ruby
KlaviyoAPI::Flows.get_flow_message_relationships_action(id)
```





#### [Get Flow Message Relationships Template](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_message_relationships_template)

```ruby
KlaviyoAPI::Flows.get_flow_message_relationships_template(id)
```





#### [Get Flow Message Template](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_message_template)

```ruby
KlaviyoAPI::Flows.get_flow_message_template(id, opts)
```





#### [Get Flow Relationships Flow Actions](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_relationships_flow_actions)

```ruby
KlaviyoAPI::Flows.get_flow_relationships_flow_actions(id, opts)
```





#### [Get Flow Relationships Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_relationships_tags)

```ruby
KlaviyoAPI::Flows.get_flow_relationships_tags(id)
```





#### [Get Flow Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flow_tags)

```ruby
KlaviyoAPI::Flows.get_flow_tags(id, opts)
```





#### [Get Flows](https://developers.klaviyo.com/en/v2024-07-15/reference/get_flows)

```ruby
KlaviyoAPI::Flows.get_flows(opts)
```





#### [Update Flow Status](https://developers.klaviyo.com/en/v2024-07-15/reference/update_flow)

```ruby
KlaviyoAPI::Flows.update_flow(id, body)
```






## Forms


#### [Get Form](https://developers.klaviyo.com/en/v2024-07-15/reference/get_form)

```ruby
KlaviyoAPI::Forms.get_form(id, opts)
```





#### [Get Form for Form Version](https://developers.klaviyo.com/en/v2024-07-15/reference/get_form_for_form_version)

```ruby
KlaviyoAPI::Forms.get_form_for_form_version(id, opts)
```





#### [Get Form ID for Form Version](https://developers.klaviyo.com/en/v2024-07-15/reference/get_form_id_for_form_version)

```ruby
KlaviyoAPI::Forms.get_form_id_for_form_version(id)
```





#### [Get Form Version](https://developers.klaviyo.com/en/v2024-07-15/reference/get_form_version)

```ruby
KlaviyoAPI::Forms.get_form_version(id, opts)
```





#### [Get Forms](https://developers.klaviyo.com/en/v2024-07-15/reference/get_forms)

```ruby
KlaviyoAPI::Forms.get_forms(opts)
```





#### [Get Version IDs for Form](https://developers.klaviyo.com/en/v2024-07-15/reference/get_version_ids_for_form)

```ruby
KlaviyoAPI::Forms.get_version_ids_for_form(id)
```





#### [Get Versions for Form](https://developers.klaviyo.com/en/v2024-07-15/reference/get_versions_for_form)

```ruby
KlaviyoAPI::Forms.get_versions_for_form(id, opts)
```






## Images


#### [Get Image](https://developers.klaviyo.com/en/v2024-07-15/reference/get_image)

```ruby
KlaviyoAPI::Images.get_image(id, opts)
```





#### [Get Images](https://developers.klaviyo.com/en/v2024-07-15/reference/get_images)

```ruby
KlaviyoAPI::Images.get_images(opts)
```





#### [Update Image](https://developers.klaviyo.com/en/v2024-07-15/reference/update_image)

```ruby
KlaviyoAPI::Images.update_image(id, body)
```





#### [Upload Image From File](https://developers.klaviyo.com/en/v2024-07-15/reference/upload_image_from_file)

```ruby
KlaviyoAPI::Images.upload_image_from_file(file, opts)
```





#### [Upload Image From URL](https://developers.klaviyo.com/en/v2024-07-15/reference/upload_image_from_url)

```ruby
KlaviyoAPI::Images.upload_image_from_url(body)
```






## Lists


#### [Create List](https://developers.klaviyo.com/en/v2024-07-15/reference/create_list)

```ruby
KlaviyoAPI::Lists.create_list(body)
```





#### [Add Profile To List](https://developers.klaviyo.com/en/v2024-07-15/reference/create_list_relationships)

```ruby
KlaviyoAPI::Lists.create_list_relationships(id, body)
```





#### [Delete List](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_list)

```ruby
KlaviyoAPI::Lists.delete_list(id)
```





#### [Remove Profile From List](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_list_relationships)

```ruby
KlaviyoAPI::Lists.delete_list_relationships(id, body)
```





#### [Get List](https://developers.klaviyo.com/en/v2024-07-15/reference/get_list)

```ruby
KlaviyoAPI::Lists.get_list(id, opts)
```





#### [Get List Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/get_list_profiles)

```ruby
KlaviyoAPI::Lists.get_list_profiles(id, opts)
```





#### [Get List Relationships Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/get_list_relationships_profiles)

```ruby
KlaviyoAPI::Lists.get_list_relationships_profiles(id, opts)
```





#### [Get List Relationships Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_list_relationships_tags)

```ruby
KlaviyoAPI::Lists.get_list_relationships_tags(id)
```





#### [Get List Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_list_tags)

```ruby
KlaviyoAPI::Lists.get_list_tags(id, opts)
```





#### [Get Lists](https://developers.klaviyo.com/en/v2024-07-15/reference/get_lists)

```ruby
KlaviyoAPI::Lists.get_lists(opts)
```





#### [Update List](https://developers.klaviyo.com/en/v2024-07-15/reference/update_list)

```ruby
KlaviyoAPI::Lists.update_list(id, body)
```






## Metrics


#### [Get Metric](https://developers.klaviyo.com/en/v2024-07-15/reference/get_metric)

```ruby
KlaviyoAPI::Metrics.get_metric(id, opts)
```





#### [Get Metrics](https://developers.klaviyo.com/en/v2024-07-15/reference/get_metrics)

```ruby
KlaviyoAPI::Metrics.get_metrics(opts)
```





#### [Query Metric Aggregates](https://developers.klaviyo.com/en/v2024-07-15/reference/query_metric_aggregates)

```ruby
KlaviyoAPI::Metrics.query_metric_aggregates(body)
```






## Profiles


#### [Create or Update Profile](https://developers.klaviyo.com/en/v2024-07-15/reference/create_or_update_profile)

```ruby
KlaviyoAPI::Profiles.create_or_update_profile(body)
```





#### [Create Profile](https://developers.klaviyo.com/en/v2024-07-15/reference/create_profile)

```ruby
KlaviyoAPI::Profiles.create_profile(body)
```





#### [Create or Update Push Token](https://developers.klaviyo.com/en/v2024-07-15/reference/create_push_token)

```ruby
KlaviyoAPI::Profiles.create_push_token(body)
```





#### [Get Bulk Profile Import Job](https://developers.klaviyo.com/en/v2024-07-15/reference/get_bulk_profile_import_job)

```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job(job_id, opts)
```





#### [Get Bulk Profile Import Job Errors](https://developers.klaviyo.com/en/v2024-07-15/reference/get_bulk_profile_import_job_import_errors)

```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_import_errors(id, opts)
```





#### [Get Bulk Profile Import Job Lists](https://developers.klaviyo.com/en/v2024-07-15/reference/get_bulk_profile_import_job_lists)

```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_lists(id, opts)
```





#### [Get Bulk Profile Import Job Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/get_bulk_profile_import_job_profiles)

```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_profiles(id, opts)
```





#### [Get Bulk Profile Import Job Relationships Lists](https://developers.klaviyo.com/en/v2024-07-15/reference/get_bulk_profile_import_job_relationships_lists)

```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_relationships_lists(id)
```





#### [Get Bulk Profile Import Job Relationships Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/get_bulk_profile_import_job_relationships_profiles)

```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_job_relationships_profiles(id, opts)
```





#### [Get Bulk Profile Import Jobs](https://developers.klaviyo.com/en/v2024-07-15/reference/get_bulk_profile_import_jobs)

```ruby
KlaviyoAPI::Profiles.get_bulk_profile_import_jobs(opts)
```





#### [Get Profile](https://developers.klaviyo.com/en/v2024-07-15/reference/get_profile)

```ruby
KlaviyoAPI::Profiles.get_profile(id, opts)
```





#### [Get Profile Lists](https://developers.klaviyo.com/en/v2024-07-15/reference/get_profile_lists)

```ruby
KlaviyoAPI::Profiles.get_profile_lists(id, opts)
```





#### [Get Profile Relationships Lists](https://developers.klaviyo.com/en/v2024-07-15/reference/get_profile_relationships_lists)

```ruby
KlaviyoAPI::Profiles.get_profile_relationships_lists(id)
```





#### [Get Profile Relationships Segments](https://developers.klaviyo.com/en/v2024-07-15/reference/get_profile_relationships_segments)

```ruby
KlaviyoAPI::Profiles.get_profile_relationships_segments(id)
```





#### [Get Profile Segments](https://developers.klaviyo.com/en/v2024-07-15/reference/get_profile_segments)

```ruby
KlaviyoAPI::Profiles.get_profile_segments(id, opts)
```





#### [Get Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/get_profiles)

```ruby
KlaviyoAPI::Profiles.get_profiles(opts)
```





#### [Merge Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/merge_profiles)

```ruby
KlaviyoAPI::Profiles.merge_profiles(body)
```





#### [Spawn Bulk Profile Import Job](https://developers.klaviyo.com/en/v2024-07-15/reference/spawn_bulk_profile_import_job)

```ruby
KlaviyoAPI::Profiles.spawn_bulk_profile_import_job(body)
```





#### [Subscribe Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/subscribe_profiles)

```ruby
KlaviyoAPI::Profiles.subscribe_profiles(body)
```





#### [Suppress Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/suppress_profiles)

```ruby
KlaviyoAPI::Profiles.suppress_profiles(body)
```





#### [Unsubscribe Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/unsubscribe_profiles)

```ruby
KlaviyoAPI::Profiles.unsubscribe_profiles(body)
```





#### [Unsuppress Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/unsuppress_profiles)

```ruby
KlaviyoAPI::Profiles.unsuppress_profiles(body)
```





#### [Update Profile](https://developers.klaviyo.com/en/v2024-07-15/reference/update_profile)

```ruby
KlaviyoAPI::Profiles.update_profile(id, body)
```






## Reporting


#### [Query Campaign Values](https://developers.klaviyo.com/en/v2024-07-15/reference/query_campaign_values)

```ruby
KlaviyoAPI::Reporting.query_campaign_values(body, opts)
```





#### [Query Flow Series](https://developers.klaviyo.com/en/v2024-07-15/reference/query_flow_series)

```ruby
KlaviyoAPI::Reporting.query_flow_series(body, opts)
```





#### [Query Flow Values](https://developers.klaviyo.com/en/v2024-07-15/reference/query_flow_values)

```ruby
KlaviyoAPI::Reporting.query_flow_values(body, opts)
```






## Segments


#### [Create Segment](https://developers.klaviyo.com/en/v2024-07-15/reference/create_segment)

```ruby
KlaviyoAPI::Segments.create_segment(body)
```





#### [Delete Segment](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_segment)

```ruby
KlaviyoAPI::Segments.delete_segment(id)
```





#### [Get Segment](https://developers.klaviyo.com/en/v2024-07-15/reference/get_segment)

```ruby
KlaviyoAPI::Segments.get_segment(id, opts)
```





#### [Get Segment Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/get_segment_profiles)

```ruby
KlaviyoAPI::Segments.get_segment_profiles(id, opts)
```





#### [Get Segment Relationships Profiles](https://developers.klaviyo.com/en/v2024-07-15/reference/get_segment_relationships_profiles)

```ruby
KlaviyoAPI::Segments.get_segment_relationships_profiles(id, opts)
```





#### [Get Segment Relationships Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_segment_relationships_tags)

```ruby
KlaviyoAPI::Segments.get_segment_relationships_tags(id)
```





#### [Get Segment Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_segment_tags)

```ruby
KlaviyoAPI::Segments.get_segment_tags(id, opts)
```





#### [Get Segments](https://developers.klaviyo.com/en/v2024-07-15/reference/get_segments)

```ruby
KlaviyoAPI::Segments.get_segments(opts)
```





#### [Update Segment](https://developers.klaviyo.com/en/v2024-07-15/reference/update_segment)

```ruby
KlaviyoAPI::Segments.update_segment(id, body)
```






## Tags


#### [Create Tag](https://developers.klaviyo.com/en/v2024-07-15/reference/create_tag)

```ruby
KlaviyoAPI::Tags.create_tag(body)
```





#### [Create Tag Group](https://developers.klaviyo.com/en/v2024-07-15/reference/create_tag_group)

```ruby
KlaviyoAPI::Tags.create_tag_group(body)
```





#### [Create Tag Relationships Campaigns](https://developers.klaviyo.com/en/v2024-07-15/reference/create_tag_relationships_campaigns)

```ruby
KlaviyoAPI::Tags.create_tag_relationships_campaigns(id, body)
```





#### [Create Tag Relationships Flows](https://developers.klaviyo.com/en/v2024-07-15/reference/create_tag_relationships_flows)

```ruby
KlaviyoAPI::Tags.create_tag_relationships_flows(id, body)
```





#### [Create Tag Relationships Lists](https://developers.klaviyo.com/en/v2024-07-15/reference/create_tag_relationships_lists)

```ruby
KlaviyoAPI::Tags.create_tag_relationships_lists(id, body)
```





#### [Create Tag Relationships Segments](https://developers.klaviyo.com/en/v2024-07-15/reference/create_tag_relationships_segments)

```ruby
KlaviyoAPI::Tags.create_tag_relationships_segments(id, body)
```





#### [Delete Tag](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_tag)

```ruby
KlaviyoAPI::Tags.delete_tag(id)
```





#### [Delete Tag Group](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_tag_group)

```ruby
KlaviyoAPI::Tags.delete_tag_group(id)
```





#### [Delete Tag Relationships Campaigns](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_tag_relationships_campaigns)

```ruby
KlaviyoAPI::Tags.delete_tag_relationships_campaigns(id, body)
```





#### [Delete Tag Relationships Flows](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_tag_relationships_flows)

```ruby
KlaviyoAPI::Tags.delete_tag_relationships_flows(id, body)
```





#### [Delete Tag Relationships Lists](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_tag_relationships_lists)

```ruby
KlaviyoAPI::Tags.delete_tag_relationships_lists(id, body)
```





#### [Delete Tag Relationships Segments](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_tag_relationships_segments)

```ruby
KlaviyoAPI::Tags.delete_tag_relationships_segments(id, body)
```





#### [Get Tag](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag)

```ruby
KlaviyoAPI::Tags.get_tag(id, opts)
```





#### [Get Tag Group](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_group)

```ruby
KlaviyoAPI::Tags.get_tag_group(id, opts)
```





#### [Get Tag Group Relationships Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_group_relationships_tags)

```ruby
KlaviyoAPI::Tags.get_tag_group_relationships_tags(id)
```





#### [Get Tag Group Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_group_tags)

```ruby
KlaviyoAPI::Tags.get_tag_group_tags(id, opts)
```





#### [Get Tag Groups](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_groups)

```ruby
KlaviyoAPI::Tags.get_tag_groups(opts)
```





#### [Get Tag Relationships Campaigns](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_relationships_campaigns)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_campaigns(id)
```





#### [Get Tag Relationships Flows](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_relationships_flows)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_flows(id)
```





#### [Get Tag Relationships Lists](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_relationships_lists)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_lists(id)
```





#### [Get Tag Relationships Segments](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_relationships_segments)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_segments(id)
```





#### [Get Tag Relationships Tag Group](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_relationships_tag_group)

```ruby
KlaviyoAPI::Tags.get_tag_relationships_tag_group(id)
```





#### [Get Tag Tag Group](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tag_tag_group)

```ruby
KlaviyoAPI::Tags.get_tag_tag_group(id, opts)
```





#### [Get Tags](https://developers.klaviyo.com/en/v2024-07-15/reference/get_tags)

```ruby
KlaviyoAPI::Tags.get_tags(opts)
```





#### [Update Tag](https://developers.klaviyo.com/en/v2024-07-15/reference/update_tag)

```ruby
KlaviyoAPI::Tags.update_tag(id, body)
```





#### [Update Tag Group](https://developers.klaviyo.com/en/v2024-07-15/reference/update_tag_group)

```ruby
KlaviyoAPI::Tags.update_tag_group(id, body)
```






## Templates


#### [Create Template](https://developers.klaviyo.com/en/v2024-07-15/reference/create_template)

```ruby
KlaviyoAPI::Templates.create_template(body)
```





#### [Create Template Clone](https://developers.klaviyo.com/en/v2024-07-15/reference/create_template_clone)

```ruby
KlaviyoAPI::Templates.create_template_clone(body)
```





#### [Create Template Render](https://developers.klaviyo.com/en/v2024-07-15/reference/create_template_render)

```ruby
KlaviyoAPI::Templates.create_template_render(body)
```





#### [Delete Template](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_template)

```ruby
KlaviyoAPI::Templates.delete_template(id)
```





#### [Get Template](https://developers.klaviyo.com/en/v2024-07-15/reference/get_template)

```ruby
KlaviyoAPI::Templates.get_template(id, opts)
```





#### [Get Templates](https://developers.klaviyo.com/en/v2024-07-15/reference/get_templates)

```ruby
KlaviyoAPI::Templates.get_templates(opts)
```





#### [Update Template](https://developers.klaviyo.com/en/v2024-07-15/reference/update_template)

```ruby
KlaviyoAPI::Templates.update_template(id, body)
```






## Webhooks


#### [Create Webhook](https://developers.klaviyo.com/en/v2024-07-15/reference/create_webhook)

```ruby
KlaviyoAPI::Webhooks.create_webhook(body)
```





#### [Delete Webhook](https://developers.klaviyo.com/en/v2024-07-15/reference/delete_webhook)

```ruby
KlaviyoAPI::Webhooks.delete_webhook(id)
```





#### [Get Webhook](https://developers.klaviyo.com/en/v2024-07-15/reference/get_webhook)

```ruby
KlaviyoAPI::Webhooks.get_webhook(id, opts)
```





#### [Get Webhook Topic](https://developers.klaviyo.com/en/v2024-07-15/reference/get_webhook_topic)

```ruby
KlaviyoAPI::Webhooks.get_webhook_topic(id)
```





#### [Get Webhook Topics](https://developers.klaviyo.com/en/v2024-07-15/reference/get_webhook_topics)

```ruby
KlaviyoAPI::Webhooks.get_webhook_topics
```





#### [Get Webhooks](https://developers.klaviyo.com/en/v2024-07-15/reference/get_webhooks)

```ruby
KlaviyoAPI::Webhooks.get_webhooks(opts)
```





#### [Update Webhook](https://developers.klaviyo.com/en/v2024-07-15/reference/update_webhook)

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
