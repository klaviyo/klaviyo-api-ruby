=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2023-09-15
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module KlaviyoAPI
  class SegmentsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get Segment
    # Get a segment with the given segment ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`<br><br>Rate limits when using the `additional-fields[segment]=profile_count` parameter in your API request:<br>Burst: `1/s`<br>Steady: `15/m`<br><br>To learn more about how the `additional-fields` parameter impacts rate limits, check out our [Rate limits, status codes, and errors](https://developers.klaviyo.com/en/v2023-09-15/docs/rate_limits_and_error_handling) guide.  **Scopes:** `segments:read`
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :additional_fields_segment Request additional fields not included by default in the response. Supported values: &#39;profile_count&#39;
    # @option opts [Array<String>] :fields_segment For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_tag For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#relationships
    # @return [Hash<String, Object>]
    def get_segment(id, opts = {})
      data, _status_code, _headers = get_segment_with_http_info(id, opts)
      data
    end

    # Get Segment
    # Get a segment with the given segment ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;75/s&#x60;&lt;br&gt;Steady: &#x60;700/m&#x60;&lt;br&gt;&lt;br&gt;Rate limits when using the &#x60;additional-fields[segment]&#x3D;profile_count&#x60; parameter in your API request:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;15/m&#x60;&lt;br&gt;&lt;br&gt;To learn more about how the &#x60;additional-fields&#x60; parameter impacts rate limits, check out our [Rate limits, status codes, and errors](https://developers.klaviyo.com/en/v2023-09-15/docs/rate_limits_and_error_handling) guide.  **Scopes:** &#x60;segments:read&#x60;
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :additional_fields_segment Request additional fields not included by default in the response. Supported values: &#39;profile_count&#39;
    # @option opts [Array<String>] :fields_segment For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_tag For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#relationships
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_segment_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SegmentsApi.get_segment ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling SegmentsApi.get_segment"
      end
      allowable_values = ["profile_count"]
      if @api_client.config.client_side_validation && opts[:'additional_fields_segment'] && !opts[:'additional_fields_segment'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"additional_fields_segment\", must include one of #{allowable_values}"
      end
      allowable_values = ["name", "created", "updated", "profile_count"]
      if @api_client.config.client_side_validation && opts[:'fields_segment'] && !opts[:'fields_segment'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_segment\", must include one of #{allowable_values}"
      end
      allowable_values = ["name"]
      if @api_client.config.client_side_validation && opts[:'fields_tag'] && !opts[:'fields_tag'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_tag\", must include one of #{allowable_values}"
      end
      allowable_values = ["tags"]
      if @api_client.config.client_side_validation && opts[:'include'] && !opts[:'include'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"include\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/segments/{id}/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'additional-fields[segment]'] = @api_client.build_collection_param(opts[:'additional_fields_segment'], :csv) if !opts[:'additional_fields_segment'].nil?
      query_params[:'fields[segment]'] = @api_client.build_collection_param(opts[:'fields_segment'], :csv) if !opts[:'fields_segment'].nil?
      query_params[:'fields[tag]'] = @api_client.build_collection_param(opts[:'fields_tag'], :csv) if !opts[:'fields_tag'].nil?
      query_params[:'include'] = @api_client.build_collection_param(opts[:'include'], :csv) if !opts[:'include'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-09-15"
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
        :operation => :"SegmentsApi.get_segment",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentsApi#get_segment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Segment Profiles
    # Get all profiles within a segment with the given segment ID.  Filter to request a subset of all profiles. Profiles can be filtered by `email`, `phone_number`, `push_token`, and `joined_group_at` fields. Profiles can be sorted by the following fields, in ascending and descending order: `joined_group_at`<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`  **Scopes:** `profiles:read` `segments:read`
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :additional_fields_profile Request additional fields not included by default in the response. Supported values: &#39;predictive_analytics&#39;
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;email&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;phone_number&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;push_token&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;_kx&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;joined_group_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 100. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sorting
    # @return [Hash<String, Object>]
    def get_segment_profiles(id, opts = {})
      data, _status_code, _headers = get_segment_profiles_with_http_info(id, opts)
      data
    end

    # Get Segment Profiles
    # Get all profiles within a segment with the given segment ID.  Filter to request a subset of all profiles. Profiles can be filtered by &#x60;email&#x60;, &#x60;phone_number&#x60;, &#x60;push_token&#x60;, and &#x60;joined_group_at&#x60; fields. Profiles can be sorted by the following fields, in ascending and descending order: &#x60;joined_group_at&#x60;&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;75/s&#x60;&lt;br&gt;Steady: &#x60;700/m&#x60;  **Scopes:** &#x60;profiles:read&#x60; &#x60;segments:read&#x60;
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :additional_fields_profile Request additional fields not included by default in the response. Supported values: &#39;predictive_analytics&#39;
    # @option opts [Array<String>] :fields_profile For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;email&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;phone_number&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;push_token&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;_kx&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;joined_group_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 100. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sorting
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_segment_profiles_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SegmentsApi.get_segment_profiles ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling SegmentsApi.get_segment_profiles"
      end
      allowable_values = ["predictive_analytics"]
      if @api_client.config.client_side_validation && opts[:'additional_fields_profile'] && !opts[:'additional_fields_profile'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"additional_fields_profile\", must include one of #{allowable_values}"
      end
      allowable_values = ["email", "phone_number", "external_id", "first_name", "last_name", "organization", "title", "image", "created", "updated", "last_event_date", "location", "location.address1", "location.address2", "location.city", "location.country", "location.latitude", "location.longitude", "location.region", "location.zip", "location.timezone", "properties", "subscriptions", "subscriptions.email", "subscriptions.email.marketing", "subscriptions.email.marketing.consent", "subscriptions.email.marketing.timestamp", "subscriptions.email.marketing.method", "subscriptions.email.marketing.method_detail", "subscriptions.email.marketing.custom_method_detail", "subscriptions.email.marketing.double_optin", "subscriptions.email.marketing.suppressions", "subscriptions.email.marketing.list_suppressions", "subscriptions.sms", "subscriptions.sms.marketing", "subscriptions.sms.marketing.consent", "subscriptions.sms.marketing.timestamp", "subscriptions.sms.marketing.method", "subscriptions.sms.marketing.method_detail", "joined_group_at", "predictive_analytics", "predictive_analytics.historic_clv", "predictive_analytics.predicted_clv", "predictive_analytics.total_clv", "predictive_analytics.historic_number_of_orders", "predictive_analytics.predicted_number_of_orders", "predictive_analytics.average_days_between_orders", "predictive_analytics.average_order_value", "predictive_analytics.churn_probability", "predictive_analytics.expected_date_of_next_order"]
      if @api_client.config.client_side_validation && opts[:'fields_profile'] && !opts[:'fields_profile'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_profile\", must include one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 100
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling SegmentsApi.get_segment_profiles, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 1
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling SegmentsApi.get_segment_profiles, must be greater than or equal to 1.'
      end

      allowable_values = ["joined_group_at", "-joined_group_at"]
      if @api_client.config.client_side_validation && opts[:'sort'] && !allowable_values.include?(opts[:'sort'])
        fail ArgumentError, "invalid value for \"sort\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/segments/{id}/profiles/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'additional-fields[profile]'] = @api_client.build_collection_param(opts[:'additional_fields_profile'], :csv) if !opts[:'additional_fields_profile'].nil?
      query_params[:'fields[profile]'] = @api_client.build_collection_param(opts[:'fields_profile'], :csv) if !opts[:'fields_profile'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'page[cursor]'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?
      query_params[:'page[size]'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-09-15"
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
        :operation => :"SegmentsApi.get_segment_profiles",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentsApi#get_segment_profiles\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Segment Relationships Profiles
    # Get all profile membership [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for the given segment ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`  **Scopes:** `profiles:read` `segments:read`
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;email&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;phone_number&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;push_token&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;_kx&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;joined_group_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 1000. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sorting
    # @return [Hash<String, Object>]
    def get_segment_relationships_profiles(id, opts = {})
      data, _status_code, _headers = get_segment_relationships_profiles_with_http_info(id, opts)
      data
    end

    # Get Segment Relationships Profiles
    # Get all profile membership [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for the given segment ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;75/s&#x60;&lt;br&gt;Steady: &#x60;700/m&#x60;  **Scopes:** &#x60;profiles:read&#x60; &#x60;segments:read&#x60;
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;email&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;phone_number&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;push_token&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;_kx&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;joined_group_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 1000. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sorting
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_segment_relationships_profiles_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SegmentsApi.get_segment_relationships_profiles ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling SegmentsApi.get_segment_relationships_profiles"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 1000
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling SegmentsApi.get_segment_relationships_profiles, must be smaller than or equal to 1000.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 1
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling SegmentsApi.get_segment_relationships_profiles, must be greater than or equal to 1.'
      end

      allowable_values = ["joined_group_at", "-joined_group_at"]
      if @api_client.config.client_side_validation && opts[:'sort'] && !allowable_values.include?(opts[:'sort'])
        fail ArgumentError, "invalid value for \"sort\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/segments/{id}/relationships/profiles/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'page[cursor]'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?
      query_params[:'page[size]'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-09-15"
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
        :operation => :"SegmentsApi.get_segment_relationships_profiles",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentsApi#get_segment_relationships_profiles\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Segment Relationships Tags
    # If `related_resource` is `tags`, returns the tag IDs of all tags associated with the given segment ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `segments:read` `tags:read`
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def get_segment_relationships_tags(id, opts = {})
      data, _status_code, _headers = get_segment_relationships_tags_with_http_info(id, opts)
      data
    end

    # Get Segment Relationships Tags
    # If &#x60;related_resource&#x60; is &#x60;tags&#x60;, returns the tag IDs of all tags associated with the given segment ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;segments:read&#x60; &#x60;tags:read&#x60;
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_segment_relationships_tags_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SegmentsApi.get_segment_relationships_tags ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling SegmentsApi.get_segment_relationships_tags"
      end
      # resource path
      local_var_path = '/api/segments/{id}/relationships/tags/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-09-15"
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
        :operation => :"SegmentsApi.get_segment_relationships_tags",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentsApi#get_segment_relationships_tags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Segment Tags
    # Return all tags associated with the given segment ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `segments:read` `tags:read`
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_tag For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_segment_tags(id, opts = {})
      data, _status_code, _headers = get_segment_tags_with_http_info(id, opts)
      data
    end

    # Get Segment Tags
    # Return all tags associated with the given segment ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;segments:read&#x60; &#x60;tags:read&#x60;
    # @param id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_tag For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_segment_tags_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SegmentsApi.get_segment_tags ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling SegmentsApi.get_segment_tags"
      end
      allowable_values = ["name"]
      if @api_client.config.client_side_validation && opts[:'fields_tag'] && !opts[:'fields_tag'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_tag\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/segments/{id}/tags/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[tag]'] = @api_client.build_collection_param(opts[:'fields_tag'], :csv) if !opts[:'fields_tag'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-09-15"
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
        :operation => :"SegmentsApi.get_segment_tags",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentsApi#get_segment_tags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Segments
    # Get all segments in an account.  Filter to request a subset of all segments. Segments can be filtered by `name`, `created`, and `updated` fields.  Returns a maximum of 10 results per page.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`  **Scopes:** `segments:read`
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_segment For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_tag For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;name&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;id&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;created&#x60;: &#x60;greater-than&#x60;&lt;br&gt;&#x60;updated&#x60;: &#x60;greater-than&#x60;
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#relationships
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#pagination
    # @return [Hash<String, Object>]
    def get_segments(opts = {})
      data, _status_code, _headers = get_segments_with_http_info(opts)
      data
    end

    # Get Segments
    # Get all segments in an account.  Filter to request a subset of all segments. Segments can be filtered by &#x60;name&#x60;, &#x60;created&#x60;, and &#x60;updated&#x60; fields.  Returns a maximum of 10 results per page.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;75/s&#x60;&lt;br&gt;Steady: &#x60;700/m&#x60;  **Scopes:** &#x60;segments:read&#x60;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_segment For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_tag For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;name&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;id&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;created&#x60;: &#x60;greater-than&#x60;&lt;br&gt;&#x60;updated&#x60;: &#x60;greater-than&#x60;
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#relationships
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2023-09-15/reference/api-overview#pagination
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_segments_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SegmentsApi.get_segments ...'
      end
      allowable_values = ["name", "created", "updated"]
      if @api_client.config.client_side_validation && opts[:'fields_segment'] && !opts[:'fields_segment'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_segment\", must include one of #{allowable_values}"
      end
      allowable_values = ["name"]
      if @api_client.config.client_side_validation && opts[:'fields_tag'] && !opts[:'fields_tag'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_tag\", must include one of #{allowable_values}"
      end
      allowable_values = ["tags"]
      if @api_client.config.client_side_validation && opts[:'include'] && !opts[:'include'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"include\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/segments/'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[segment]'] = @api_client.build_collection_param(opts[:'fields_segment'], :csv) if !opts[:'fields_segment'].nil?
      query_params[:'fields[tag]'] = @api_client.build_collection_param(opts[:'fields_tag'], :csv) if !opts[:'fields_tag'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'include'] = @api_client.build_collection_param(opts[:'include'], :csv) if !opts[:'include'].nil?
      query_params[:'page[cursor]'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-09-15"
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
        :operation => :"SegmentsApi.get_segments",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentsApi#get_segments\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Segment
    # Update the name of a segment with the given segment ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `segments:write`
    # @param id [String] 
    # @param segment_partial_update_query [SegmentPartialUpdateQuery] 
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def update_segment(id, segment_partial_update_query, opts = {})
      data, _status_code, _headers = update_segment_with_http_info(id, segment_partial_update_query, opts)
      data
    end

    # Update Segment
    # Update the name of a segment with the given segment ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;segments:write&#x60;
    # @param id [String] 
    # @param segment_partial_update_query [SegmentPartialUpdateQuery] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def update_segment_with_http_info(id, segment_partial_update_query, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SegmentsApi.update_segment ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling SegmentsApi.update_segment"
      end
      # verify the required parameter 'segment_partial_update_query' is set
      if @api_client.config.client_side_validation && segment_partial_update_query.nil?
        fail ArgumentError, "Missing the required parameter 'segment_partial_update_query' when calling SegmentsApi.update_segment"
      end
      # resource path
      local_var_path = '/api/segments/{id}/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['API_REVISION'] || "2023-09-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(segment_partial_update_query)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"SegmentsApi.update_segment",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentsApi#update_segment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
