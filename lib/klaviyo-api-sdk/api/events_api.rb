=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2024-02-15
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module KlaviyoAPI
  class EventsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Event
    # Create a new event to track a profile's activity.  Successful response indicates that the event was validated and submitted for processing, but does not guarantee that processing is complete.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `events:write`
    # @param event_create_query_v2 [EventCreateQueryV2]
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def create_event(event_create_query_v2, opts = {})
      create_event_with_http_info(event_create_query_v2, opts)
      nil
    end

    # Create Event
    # Create a new event to track a profile&#39;s activity.  Successful response indicates that the event was validated and submitted for processing, but does not guarantee that processing is complete.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;events:write&#x60;
    # @param event_create_query_v2 [EventCreateQueryV2]
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def create_event_with_http_info(event_create_query_v2, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.create_event ...'
      end
      # verify the required parameter 'event_create_query_v2' is set
      if @api_client.config.client_side_validation && event_create_query_v2.nil?
        fail ArgumentError, "Missing the required parameter 'event_create_query_v2' when calling EventsApi.create_event"
      end
      # resource path
      local_var_path = '/api/events/'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-02-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(event_create_query_v2)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"EventsApi.create_event",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#create_event\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Event
    # Get an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `events:read`
    # @param id [String] ID of the event
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    # @return [Hash<String, Object>]
    def get_event(id, opts = {})
      data, _status_code, _headers = get_event_with_http_info(id, opts)
      data
    end

    # Get Event
    # Get an event with the given event ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;events:read&#x60;
    # @param id [String] ID of the event
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_event_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_event ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EventsApi.get_event"
      end
      allowable_values = ["timestamp", "event_properties", "datetime", "uuid"]
      if @api_client.config.client_side_validation && opts[:'fields_event'] && !opts[:'fields_event'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_event\", must include one of #{allowable_values}"
      end
      allowable_values = ["name", "created", "updated", "integration"]
      if @api_client.config.client_side_validation && opts[:'fields_metric'] && !opts[:'fields_metric'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_metric\", must include one of #{allowable_values}"
      end
      allowable_values = ["email", "phone_number", "external_id", "first_name", "last_name", "organization", "title", "image", "created", "updated", "last_event_date", "location", "location.address1", "location.address2", "location.city", "location.country", "location.latitude", "location.longitude", "location.region", "location.zip", "location.timezone", "location.ip", "properties"]
      if @api_client.config.client_side_validation && opts[:'fields_profile'] && !opts[:'fields_profile'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_profile\", must include one of #{allowable_values}"
      end
      allowable_values = ["attributions", "metric", "profile"]
      if @api_client.config.client_side_validation && opts[:'include'] && !opts[:'include'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"include\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/events/{id}/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[event]'] = @api_client.build_collection_param(opts[:'fields_event'], :csv) if !opts[:'fields_event'].nil?
      query_params[:'fields[metric]'] = @api_client.build_collection_param(opts[:'fields_metric'], :csv) if !opts[:'fields_metric'].nil?
      query_params[:'fields[profile]'] = @api_client.build_collection_param(opts[:'fields_profile'], :csv) if !opts[:'fields_profile'].nil?
      query_params[:'include'] = @api_client.build_collection_param(opts[:'include'], :csv) if !opts[:'include'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-02-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"EventsApi.get_event",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_event\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Event Metric
    # Get the metric for an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `events:read` `metrics:read`
    # @param id [String]
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_event_metric(id, opts = {})
      data, _status_code, _headers = get_event_metric_with_http_info(id, opts)
      data
    end

    # Get Event Metric
    # Get the metric for an event with the given event ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;events:read&#x60; &#x60;metrics:read&#x60;
    # @param id [String]
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_event_metric_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_event_metric ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EventsApi.get_event_metric"
      end
      allowable_values = ["name", "created", "updated", "integration"]
      if @api_client.config.client_side_validation && opts[:'fields_metric'] && !opts[:'fields_metric'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_metric\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/events/{id}/metric/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[metric]'] = @api_client.build_collection_param(opts[:'fields_metric'], :csv) if !opts[:'fields_metric'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-02-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"EventsApi.get_event_metric",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_event_metric\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Event Profile
    # Get the profile associated with an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `events:read` `profiles:read`
    # @param id [String]
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :additional_fields_profile Request additional fields not included by default in the response. Supported values: &#39;subscriptions&#39;, &#39;predictive_analytics&#39;
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_event_profile(id, opts = {})
      data, _status_code, _headers = get_event_profile_with_http_info(id, opts)
      data
    end

    # Get Event Profile
    # Get the profile associated with an event with the given event ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;events:read&#x60; &#x60;profiles:read&#x60;
    # @param id [String]
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :additional_fields_profile Request additional fields not included by default in the response. Supported values: &#39;subscriptions&#39;, &#39;predictive_analytics&#39;
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_event_profile_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_event_profile ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EventsApi.get_event_profile"
      end
      allowable_values = ["subscriptions", "predictive_analytics"]
      if @api_client.config.client_side_validation && opts[:'additional_fields_profile'] && !opts[:'additional_fields_profile'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"additional_fields_profile\", must include one of #{allowable_values}"
      end
      allowable_values = ["email", "phone_number", "external_id", "first_name", "last_name", "organization", "title", "image", "created", "updated", "last_event_date", "location", "location.address1", "location.address2", "location.city", "location.country", "location.latitude", "location.longitude", "location.region", "location.zip", "location.timezone", "location.ip", "properties", "subscriptions", "subscriptions.email", "subscriptions.email.marketing", "subscriptions.email.marketing.can_receive_email_marketing", "subscriptions.email.marketing.consent", "subscriptions.email.marketing.consent_timestamp", "subscriptions.email.marketing.last_updated", "subscriptions.email.marketing.method", "subscriptions.email.marketing.method_detail", "subscriptions.email.marketing.custom_method_detail", "subscriptions.email.marketing.double_optin", "subscriptions.email.marketing.suppression", "subscriptions.email.marketing.list_suppressions", "subscriptions.sms", "subscriptions.sms.marketing", "subscriptions.sms.marketing.can_receive_sms_marketing", "subscriptions.sms.marketing.consent", "subscriptions.sms.marketing.consent_timestamp", "subscriptions.sms.marketing.method", "subscriptions.sms.marketing.method_detail", "subscriptions.sms.marketing.last_updated", "predictive_analytics", "predictive_analytics.historic_clv", "predictive_analytics.predicted_clv", "predictive_analytics.total_clv", "predictive_analytics.historic_number_of_orders", "predictive_analytics.predicted_number_of_orders", "predictive_analytics.average_days_between_orders", "predictive_analytics.average_order_value", "predictive_analytics.churn_probability", "predictive_analytics.expected_date_of_next_order"]
      if @api_client.config.client_side_validation && opts[:'fields_profile'] && !opts[:'fields_profile'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_profile\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/events/{id}/profile/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'additional-fields[profile]'] = @api_client.build_collection_param(opts[:'additional_fields_profile'], :csv) if !opts[:'additional_fields_profile'].nil?
      query_params[:'fields[profile]'] = @api_client.build_collection_param(opts[:'fields_profile'], :csv) if !opts[:'fields_profile'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-02-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"EventsApi.get_event_profile",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_event_profile\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Event Relationships Metric
    # Get a list of related Metrics for an Event<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `events:read` `metrics:read`
    # @param id [String]
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def get_event_relationships_metric(id, opts = {})
      data, _status_code, _headers = get_event_relationships_metric_with_http_info(id, opts)
      data
    end

    # Get Event Relationships Metric
    # Get a list of related Metrics for an Event&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;events:read&#x60; &#x60;metrics:read&#x60;
    # @param id [String]
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_event_relationships_metric_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_event_relationships_metric ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EventsApi.get_event_relationships_metric"
      end
      # resource path
      local_var_path = '/api/events/{id}/relationships/metric/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-02-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"EventsApi.get_event_relationships_metric",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_event_relationships_metric\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Event Relationships Profile
    # Get profile [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `events:read` `profiles:read`
    # @param id [String]
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def get_event_relationships_profile(id, opts = {})
      data, _status_code, _headers = get_event_relationships_profile_with_http_info(id, opts)
      data
    end

    # Get Event Relationships Profile
    # Get profile [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for an event with the given event ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;events:read&#x60; &#x60;profiles:read&#x60;
    # @param id [String]
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_event_relationships_profile_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_event_relationships_profile ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EventsApi.get_event_relationships_profile"
      end
      # resource path
      local_var_path = '/api/events/{id}/relationships/profile/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-02-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"EventsApi.get_event_relationships_profile",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_event_relationships_profile\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Events
    # Get all events in an account  Requests can be sorted by the following fields: `datetime`, `timestamp`  Returns a maximum of 200 events per page.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `events:read`
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;metric_id&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;profile_id&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;profile&#x60;: &#x60;has&#x60;&lt;br&gt;&#x60;datetime&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;timestamp&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting
    # @return [Hash<String, Object>]
    def get_events(opts = {})
      data, _status_code, _headers = get_events_with_http_info(opts)
      data
    end

    # Get Events
    # Get all events in an account  Requests can be sorted by the following fields: &#x60;datetime&#x60;, &#x60;timestamp&#x60;  Returns a maximum of 200 events per page.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;events:read&#x60;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;metric_id&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;profile_id&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;profile&#x60;: &#x60;has&#x60;&lt;br&gt;&#x60;datetime&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;timestamp&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_events_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_events ...'
      end
      allowable_values = ["timestamp", "event_properties", "datetime", "uuid"]
      if @api_client.config.client_side_validation && opts[:'fields_event'] && !opts[:'fields_event'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_event\", must include one of #{allowable_values}"
      end
      allowable_values = ["name", "created", "updated", "integration"]
      if @api_client.config.client_side_validation && opts[:'fields_metric'] && !opts[:'fields_metric'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_metric\", must include one of #{allowable_values}"
      end
      allowable_values = ["email", "phone_number", "external_id", "first_name", "last_name", "organization", "title", "image", "created", "updated", "last_event_date", "location", "location.address1", "location.address2", "location.city", "location.country", "location.latitude", "location.longitude", "location.region", "location.zip", "location.timezone", "location.ip", "properties"]
      if @api_client.config.client_side_validation && opts[:'fields_profile'] && !opts[:'fields_profile'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_profile\", must include one of #{allowable_values}"
      end
      allowable_values = ["attributions", "metric", "profile"]
      if @api_client.config.client_side_validation && opts[:'include'] && !opts[:'include'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"include\", must include one of #{allowable_values}"
      end
      allowable_values = ["datetime", "-datetime", "timestamp", "-timestamp"]
      if @api_client.config.client_side_validation && opts[:'sort'] && !allowable_values.include?(opts[:'sort'])
        fail ArgumentError, "invalid value for \"sort\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/events/'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[event]'] = @api_client.build_collection_param(opts[:'fields_event'], :csv) if !opts[:'fields_event'].nil?
      query_params[:'fields[metric]'] = @api_client.build_collection_param(opts[:'fields_metric'], :csv) if !opts[:'fields_metric'].nil?
      query_params[:'fields[profile]'] = @api_client.build_collection_param(opts[:'fields_profile'], :csv) if !opts[:'fields_profile'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'include'] = @api_client.build_collection_param(opts[:'include'], :csv) if !opts[:'include'].nil?
      query_params[:'page[cursor]'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-02-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"EventsApi.get_events",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_events\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
