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
  class EventsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Event
    # Create an event. Events are created asynchronously. Successful response indicates that the event was validated and submitted for processing, but does not guarantee that processing is complete.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `Events Write`
    # @param event_create_query [EventCreateQuery] Event to create.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def create_event(event_create_query, opts = {})
      create_event_with_http_info(event_create_query, opts)
      nil
    end

    # Create Event
    # Create an event. Events are created asynchronously. Successful response indicates that the event was validated and submitted for processing, but does not guarantee that processing is complete.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;Events Write&#x60;
    # @param event_create_query [EventCreateQuery] Event to create.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def create_event_with_http_info(event_create_query, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.create_event ...'
      end
      # verify the required parameter 'event_create_query' is set
      if @api_client.config.client_side_validation && event_create_query.nil?
        fail ArgumentError, "Missing the required parameter 'event_create_query' when calling EventsApi.create_event"
      end
      # resource path
      local_var_path = '/api/events/'

      # query parameters
      query_params = opts[:query_params] || {}

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
    # Get an event with the given event ID. Include parameters can be provided to get the following related resource data: `metrics`, `profiles`<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `Events Read`
    # @param id [String] ID of the event
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#relationships
    # @return [Hash<String, Object>]
    def get_event(id, opts = {})
      data, _status_code, _headers = get_event_with_http_info(id, opts)
      data
    end

    # Get Event
    # Get an event with the given event ID. Include parameters can be provided to get the following related resource data: &#x60;metrics&#x60;, &#x60;profiles&#x60;&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;Events Read&#x60;
    # @param id [String] ID of the event
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#relationships
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_event_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_event ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EventsApi.get_event"
      end
      allowable_values = ["metric_id", "profile_id", "timestamp", "event_properties", "datetime", "uuid"]
      if @api_client.config.client_side_validation && opts[:'fields_event'] && !opts[:'fields_event'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_event\", must include one of #{allowable_values}"
      end
      allowable_values = ["name", "created", "updated", "integration"]
      if @api_client.config.client_side_validation && opts[:'fields_metric'] && !opts[:'fields_metric'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_metric\", must include one of #{allowable_values}"
      end
      allowable_values = ["email", "phone_number", "external_id", "anonymous_id", "first_name", "last_name", "organization", "title", "image", "created", "updated", "last_event_date", "location", "location.address1", "location.address2", "location.city", "location.country", "location.latitude", "location.longitude", "location.region", "location.zip", "location.timezone", "properties"]
      if @api_client.config.client_side_validation && opts[:'fields_profile'] && !opts[:'fields_profile'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_profile\", must include one of #{allowable_values}"
      end
      allowable_values = ["metrics", "profiles"]
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
      header_params['revision'] =  ENV['API_REVISION'] || "2023-01-24"
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

    # Get Event Metrics
    # Get the metric for an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `Events Read` `Metrics Read`
    # @param id [String] ID of the event
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_event_metrics(id, opts = {})
      data, _status_code, _headers = get_event_metrics_with_http_info(id, opts)
      data
    end

    # Get Event Metrics
    # Get the metric for an event with the given event ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;Events Read&#x60; &#x60;Metrics Read&#x60;
    # @param id [String] ID of the event
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_event_metrics_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_event_metrics ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EventsApi.get_event_metrics"
      end
      allowable_values = ["name", "created", "updated", "integration"]
      if @api_client.config.client_side_validation && opts[:'fields_metric'] && !opts[:'fields_metric'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_metric\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/events/{id}/metrics/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[metric]'] = @api_client.build_collection_param(opts[:'fields_metric'], :csv) if !opts[:'fields_metric'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-01-24"
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
        :operation => :"EventsApi.get_event_metrics",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_event_metrics\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Event Profiles
    # Get the profile associated with an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `Events Read` `Profiles Read`
    # @param id [String] ID of the event
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_event_profiles(id, opts = {})
      data, _status_code, _headers = get_event_profiles_with_http_info(id, opts)
      data
    end

    # Get Event Profiles
    # Get the profile associated with an event with the given event ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;Events Read&#x60; &#x60;Profiles Read&#x60;
    # @param id [String] ID of the event
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_event_profiles_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_event_profiles ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EventsApi.get_event_profiles"
      end
      allowable_values = ["email", "phone_number", "external_id", "anonymous_id", "first_name", "last_name", "organization", "title", "image", "created", "updated", "last_event_date", "location", "location.address1", "location.address2", "location.city", "location.country", "location.latitude", "location.longitude", "location.region", "location.zip", "location.timezone", "properties"]
      if @api_client.config.client_side_validation && opts[:'fields_profile'] && !opts[:'fields_profile'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_profile\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/events/{id}/profiles/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[profile]'] = @api_client.build_collection_param(opts[:'fields_profile'], :csv) if !opts[:'fields_profile'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-01-24"
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
        :operation => :"EventsApi.get_event_profiles",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_event_profiles\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Event Relationships
    # Get metrics or profile [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `Events Read` `Metrics Read` `Profiles Read`
    # @param id [String] 
    # @param related_resource [String] 
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def get_event_relationships(id, related_resource, opts = {})
      data, _status_code, _headers = get_event_relationships_with_http_info(id, related_resource, opts)
      data
    end

    # Get Event Relationships
    # Get metrics or profile [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for an event with the given event ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;Events Read&#x60; &#x60;Metrics Read&#x60; &#x60;Profiles Read&#x60;
    # @param id [String] 
    # @param related_resource [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_event_relationships_with_http_info(id, related_resource, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_event_relationships ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EventsApi.get_event_relationships"
      end
      # verify the required parameter 'related_resource' is set
      if @api_client.config.client_side_validation && related_resource.nil?
        fail ArgumentError, "Missing the required parameter 'related_resource' when calling EventsApi.get_event_relationships"
      end
      # verify enum value
      allowable_values = ["metrics", "profiles"]
      if @api_client.config.client_side_validation && !allowable_values.include?(related_resource)
        fail ArgumentError, "invalid value for \"related_resource\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/events/{id}/relationships/{related_resource}/'.sub('{' + 'id' + '}', CGI.escape(id.to_s)).sub('{' + 'related_resource' + '}', CGI.escape(related_resource.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-01-24"
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
        :operation => :"EventsApi.get_event_relationships",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EventsApi#get_event_relationships\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Events
    # Get all events in an account Requests can be sorted by the following fields: `datetime`, `timestamp` Include parameters can be provided to get the following related resource data: `metrics`, `profiles` Returns a maximum of 200 events per page.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`  **Scopes:** `Events Read`
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;metric_id&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;datetime&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;timestamp&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#relationships
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#pagination
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sorting
    # @return [Hash<String, Object>]
    def get_events(opts = {})
      data, _status_code, _headers = get_events_with_http_info(opts)
      data
    end

    # Get Events
    # Get all events in an account Requests can be sorted by the following fields: &#x60;datetime&#x60;, &#x60;timestamp&#x60; Include parameters can be provided to get the following related resource data: &#x60;metrics&#x60;, &#x60;profiles&#x60; Returns a maximum of 200 events per page.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;350/s&#x60;&lt;br&gt;Steady: &#x60;3500/m&#x60;  **Scopes:** &#x60;Events Read&#x60;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;metric_id&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;datetime&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;timestamp&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#relationships
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#pagination
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2023-01-24/reference/api-overview#sorting
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_events_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EventsApi.get_events ...'
      end
      allowable_values = ["metric_id", "profile_id", "timestamp", "event_properties", "datetime", "uuid"]
      if @api_client.config.client_side_validation && opts[:'fields_event'] && !opts[:'fields_event'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_event\", must include one of #{allowable_values}"
      end
      allowable_values = ["name", "created", "updated", "integration"]
      if @api_client.config.client_side_validation && opts[:'fields_metric'] && !opts[:'fields_metric'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_metric\", must include one of #{allowable_values}"
      end
      allowable_values = ["email", "phone_number", "external_id", "anonymous_id", "first_name", "last_name", "organization", "title", "image", "created", "updated", "last_event_date", "location", "location.address1", "location.address2", "location.city", "location.country", "location.latitude", "location.longitude", "location.region", "location.zip", "location.timezone", "properties"]
      if @api_client.config.client_side_validation && opts[:'fields_profile'] && !opts[:'fields_profile'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_profile\", must include one of #{allowable_values}"
      end
      allowable_values = ["metrics", "profiles"]
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
      header_params['revision'] =  ENV['API_REVISION'] || "2023-01-24"
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
