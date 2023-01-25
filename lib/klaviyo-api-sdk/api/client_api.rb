=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2023-01-24
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module KlaviyoAPI
  class ClientApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Client Event
    # Create a new event to track a profile's activity. This endpoint is specifically designed to be called from publicly-browseable, client-side environments only. To create events from server-based applications, please use [POST /api/events](https://developers.klaviyo.com/en/reference/create_event)<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `Events Write`
    # @param company_id [String] ID of the Company to create event
    # @param event_create_query [EventCreateQuery] Event to create.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def create_client_event(company_id, event_create_query, opts = {})
      create_client_event_with_http_info(company_id, event_create_query, opts)
      nil
    end

    # Create Client Event
    # Create a new event to track a profile&#39;s activity. This endpoint is specifically designed to be called from publicly-browseable, client-side environments only. To create events from server-based applications, please use [POST /api/events](https://developers.klaviyo.com/en/reference/create_event)&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;Events Write&#x60;
    # @param company_id [String] ID of the Company to create event
    # @param event_create_query [EventCreateQuery] Event to create.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def create_client_event_with_http_info(company_id, event_create_query, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ClientApi.create_client_event ...'
      end
      # verify the required parameter 'company_id' is set
      if @api_client.config.client_side_validation && company_id.nil?
        fail ArgumentError, "Missing the required parameter 'company_id' when calling ClientApi.create_client_event"
      end
      # verify the required parameter 'event_create_query' is set
      if @api_client.config.client_side_validation && event_create_query.nil?
        fail ArgumentError, "Missing the required parameter 'event_create_query' when calling ClientApi.create_client_event"
      end
      # resource path
      local_var_path = '/client/events/'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'company_id'] = company_id

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-01-24"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(event_create_query)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"ClientApi.create_client_event",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ClientApi#create_client_event\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create or Update Client Profile
    # Create and update properties about a profile without tracking an associated event. This endpoint is specifically designed to be called from publicly-browseable, client-side environments only. To create profiles from server applications (e.g. custom server-side scripts / applications), please use [POST /api/profiles](https://developers.klaviyo.com/en/reference/create_profile)<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `Profiles Write`
    # @param company_id [String] 
    # @param onsite_profile_create_query [OnsiteProfileCreateQuery] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def create_client_profile(company_id, onsite_profile_create_query, opts = {})
      create_client_profile_with_http_info(company_id, onsite_profile_create_query, opts)
      nil
    end

    # Create or Update Client Profile
    # Create and update properties about a profile without tracking an associated event. This endpoint is specifically designed to be called from publicly-browseable, client-side environments only. To create profiles from server applications (e.g. custom server-side scripts / applications), please use [POST /api/profiles](https://developers.klaviyo.com/en/reference/create_profile)&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;Profiles Write&#x60;
    # @param company_id [String] 
    # @param onsite_profile_create_query [OnsiteProfileCreateQuery] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def create_client_profile_with_http_info(company_id, onsite_profile_create_query, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ClientApi.create_client_profile ...'
      end
      # verify the required parameter 'company_id' is set
      if @api_client.config.client_side_validation && company_id.nil?
        fail ArgumentError, "Missing the required parameter 'company_id' when calling ClientApi.create_client_profile"
      end
      # verify the required parameter 'onsite_profile_create_query' is set
      if @api_client.config.client_side_validation && onsite_profile_create_query.nil?
        fail ArgumentError, "Missing the required parameter 'onsite_profile_create_query' when calling ClientApi.create_client_profile"
      end
      # resource path
      local_var_path = '/client/profiles/'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'company_id'] = company_id

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-01-24"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(onsite_profile_create_query)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"ClientApi.create_client_profile",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ClientApi#create_client_profile\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Client Subscription
    # Create a new subscription for the given list ID and channel:  * Email `email` * SMS `phone_number`  This endpoint is specifically designed to be called from publicly-browseable, client-side environments only. To create subscriptions from server-based applications, please use [POST /api/profile-subscription-bulk-create-jobs](https://developers.klaviyo.com/en/reference/subscribe_profiles)<br><br>*Rate limits*:<br>Burst: `100/s`<br>Steady: `100/m`  **Scopes:** `Subscriptions Write`
    # @param company_id [String] Your company ID.
    # @param onsite_subscription_create_query [OnsiteSubscriptionCreateQuery] Creates a subscription and consent records for Email and or SMS channels based on the provided email and phone_number attributes respectively. One of either email or phone_number must be provided. To create a subscription and consent record for only one channel but still include the other channel as a profile property the consent channel can be provided as a top level attribute and the other channel can be included in the properties object.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def create_client_subscription(company_id, onsite_subscription_create_query, opts = {})
      create_client_subscription_with_http_info(company_id, onsite_subscription_create_query, opts)
      nil
    end

    # Create Client Subscription
    # Create a new subscription for the given list ID and channel:  * Email &#x60;email&#x60; * SMS &#x60;phone_number&#x60;  This endpoint is specifically designed to be called from publicly-browseable, client-side environments only. To create subscriptions from server-based applications, please use [POST /api/profile-subscription-bulk-create-jobs](https://developers.klaviyo.com/en/reference/subscribe_profiles)&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;100/s&#x60;&lt;br&gt;Steady: &#x60;100/m&#x60;  **Scopes:** &#x60;Subscriptions Write&#x60;
    # @param company_id [String] Your company ID.
    # @param onsite_subscription_create_query [OnsiteSubscriptionCreateQuery] Creates a subscription and consent records for Email and or SMS channels based on the provided email and phone_number attributes respectively. One of either email or phone_number must be provided. To create a subscription and consent record for only one channel but still include the other channel as a profile property the consent channel can be provided as a top level attribute and the other channel can be included in the properties object.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def create_client_subscription_with_http_info(company_id, onsite_subscription_create_query, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ClientApi.create_client_subscription ...'
      end
      # verify the required parameter 'company_id' is set
      if @api_client.config.client_side_validation && company_id.nil?
        fail ArgumentError, "Missing the required parameter 'company_id' when calling ClientApi.create_client_subscription"
      end
      # verify the required parameter 'onsite_subscription_create_query' is set
      if @api_client.config.client_side_validation && onsite_subscription_create_query.nil?
        fail ArgumentError, "Missing the required parameter 'onsite_subscription_create_query' when calling ClientApi.create_client_subscription"
      end
      # resource path
      local_var_path = '/client/subscriptions/'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'company_id'] = company_id

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(onsite_subscription_create_query)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"ClientApi.create_client_subscription",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ClientApi#create_client_subscription\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
