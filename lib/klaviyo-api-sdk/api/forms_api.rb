=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2024-10-15
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module KlaviyoAPI
  class FormsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get Form
    # Get the form with the given ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `forms:read`
    # @param id [String] The ID of the form
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form_version For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_form For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#relationships
    # @return [Hash<String, Object>]
    def get_form(id, opts = {})
      data, _status_code, _headers = get_form_with_http_info(id, opts)
      data
    end

    # Get Form
    # Get the form with the given ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;forms:read&#x60;
    # @param id [String] The ID of the form
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form_version For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_form For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#relationships
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_form_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FormsApi.get_form ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling FormsApi.get_form"
      end
      allowable_values = ["form_type", "ab_test", "ab_test.variation_name", "status", "created_at", "updated_at"]
      if @api_client.config.client_side_validation && opts[:'fields_form_version'] && !opts[:'fields_form_version'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_form_version\", must include one of #{allowable_values}"
      end
      allowable_values = ["name", "status", "ab_test", "created_at", "updated_at"]
      if @api_client.config.client_side_validation && opts[:'fields_form'] && !opts[:'fields_form'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_form\", must include one of #{allowable_values}"
      end
      allowable_values = ["form-versions"]
      if @api_client.config.client_side_validation && opts[:'include'] && !opts[:'include'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"include\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/forms/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[form-version]'] = @api_client.build_collection_param(opts[:'fields_form_version'], :csv) if !opts[:'fields_form_version'].nil?
      query_params[:'fields[form]'] = @api_client.build_collection_param(opts[:'fields_form'], :csv) if !opts[:'fields_form'].nil?
      query_params[:'include'] = @api_client.build_collection_param(opts[:'include'], :csv) if !opts[:'include'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-10-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.api+json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"FormsApi.get_form",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FormsApi#get_form\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Form for Form Version
    # Get the form associated with the given form version.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `forms:read`
    # @param id [String] The ID of the form version
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_form_for_form_version(id, opts = {})
      data, _status_code, _headers = get_form_for_form_version_with_http_info(id, opts)
      data
    end

    # alias of `get_form_for_form_version`
    alias get_form_version_form get_form_for_form_version

    # Get Form for Form Version
    # Get the form associated with the given form version.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;forms:read&#x60;
    # @param id [String] The ID of the form version
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_form_for_form_version_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FormsApi.get_form_for_form_version ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling FormsApi.get_form_for_form_version"
      end
      allowable_values = ["name", "status", "ab_test", "created_at", "updated_at"]
      if @api_client.config.client_side_validation && opts[:'fields_form'] && !opts[:'fields_form'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_form\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/form-versions/{id}/form'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[form]'] = @api_client.build_collection_param(opts[:'fields_form'], :csv) if !opts[:'fields_form'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-10-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.api+json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"FormsApi.get_form_for_form_version",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FormsApi#get_form_for_form_version\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `get_form_for_form_version_with_http_info`
    alias get_form_version_form_with_http_info get_form_for_form_version_with_http_info

    # Get Form ID for Form Version
    # Get the ID of the form associated with the given form version.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `forms:read`
    # @param id [String] The ID of the form version
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def get_form_id_for_form_version(id, opts = {})
      data, _status_code, _headers = get_form_id_for_form_version_with_http_info(id, opts)
      data
    end

    # alias of `get_form_id_for_form_version`
    alias get_form_version_relationships_form get_form_id_for_form_version

    # Get Form ID for Form Version
    # Get the ID of the form associated with the given form version.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;forms:read&#x60;
    # @param id [String] The ID of the form version
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_form_id_for_form_version_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FormsApi.get_form_id_for_form_version ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling FormsApi.get_form_id_for_form_version"
      end
      # resource path
      local_var_path = '/api/form-versions/{id}/relationships/form'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-10-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.api+json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"FormsApi.get_form_id_for_form_version",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FormsApi#get_form_id_for_form_version\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `get_form_id_for_form_version_with_http_info`
    alias get_form_version_relationships_form_with_http_info get_form_id_for_form_version_with_http_info

    # Get Form Version
    # Get the form version with the given ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `forms:read`
    # @param id [String] The ID of the form version
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form_version For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_form_version(id, opts = {})
      data, _status_code, _headers = get_form_version_with_http_info(id, opts)
      data
    end

    # Get Form Version
    # Get the form version with the given ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;forms:read&#x60;
    # @param id [String] The ID of the form version
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form_version For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_form_version_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FormsApi.get_form_version ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling FormsApi.get_form_version"
      end
      allowable_values = ["form_type", "ab_test", "ab_test.variation_name", "status", "created_at", "updated_at"]
      if @api_client.config.client_side_validation && opts[:'fields_form_version'] && !opts[:'fields_form_version'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_form_version\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/form-versions/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[form-version]'] = @api_client.build_collection_param(opts[:'fields_form_version'], :csv) if !opts[:'fields_form_version'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-10-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.api+json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"FormsApi.get_form_version",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FormsApi#get_form_version\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Forms
    # Get all forms in an account.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `forms:read`
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;id&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;name&#x60;: &#x60;any&#x60;, &#x60;contains&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;ab_test&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;updated_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;created_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;status&#x60;: &#x60;equals&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 100. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sorting
    # @return [Hash<String, Object>]
    def get_forms(opts = {})
      data, _status_code, _headers = get_forms_with_http_info(opts)
      data
    end

    # Get Forms
    # Get all forms in an account.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;forms:read&#x60;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;id&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;name&#x60;: &#x60;any&#x60;, &#x60;contains&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;ab_test&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;updated_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;created_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;status&#x60;: &#x60;equals&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 100. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sorting
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_forms_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FormsApi.get_forms ...'
      end
      allowable_values = ["name", "status", "ab_test", "created_at", "updated_at"]
      if @api_client.config.client_side_validation && opts[:'fields_form'] && !opts[:'fields_form'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_form\", must include one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 100
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling FormsApi.get_forms, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 1
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling FormsApi.get_forms, must be greater than or equal to 1.'
      end

      allowable_values = ["created_at", "-created_at", "updated_at", "-updated_at"]
      if @api_client.config.client_side_validation && opts[:'sort'] && !allowable_values.include?(opts[:'sort'])
        fail ArgumentError, "invalid value for \"sort\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/forms'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[form]'] = @api_client.build_collection_param(opts[:'fields_form'], :csv) if !opts[:'fields_form'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'page[cursor]'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?
      query_params[:'page[size]'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-10-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.api+json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"FormsApi.get_forms",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FormsApi#get_forms\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Version IDs for Form
    # Get the IDs of the form versions for the given form.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `forms:read`
    # @param id [String] The ID of the form
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def get_version_ids_for_form(id, opts = {})
      data, _status_code, _headers = get_version_ids_for_form_with_http_info(id, opts)
      data
    end

    # alias of `get_version_ids_for_form`
    alias get_form_relationships_form_versions get_version_ids_for_form

    # alias of `get_version_ids_for_form`
    alias get_form_relationships_versions get_version_ids_for_form

    # Get Version IDs for Form
    # Get the IDs of the form versions for the given form.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;forms:read&#x60;
    # @param id [String] The ID of the form
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_version_ids_for_form_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FormsApi.get_version_ids_for_form ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling FormsApi.get_version_ids_for_form"
      end
      # resource path
      local_var_path = '/api/forms/{id}/relationships/form-versions'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-10-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.api+json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"FormsApi.get_version_ids_for_form",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FormsApi#get_version_ids_for_form\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `get_version_ids_for_form_with_http_info`
    alias get_form_relationships_form_versions_with_http_info get_version_ids_for_form_with_http_info

    # alias of `get_version_ids_for_form_with_http_info`
    alias get_form_relationships_versions_with_http_info get_version_ids_for_form_with_http_info

    # Get Versions for Form
    # Get the form versions for the given form.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `forms:read`
    # @param id [String] The ID of the form
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form_version For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;form_type&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;status&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;updated_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;created_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 100. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sorting
    # @return [Hash<String, Object>]
    def get_versions_for_form(id, opts = {})
      data, _status_code, _headers = get_versions_for_form_with_http_info(id, opts)
      data
    end

    # alias of `get_versions_for_form`
    alias get_form_form_versions get_versions_for_form

    # alias of `get_versions_for_form`
    alias get_form_versions get_versions_for_form

    # Get Versions for Form
    # Get the form versions for the given form.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;forms:read&#x60;
    # @param id [String] The ID of the form
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_form_version For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;form_type&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;status&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;updated_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;&lt;br&gt;&#x60;created_at&#x60;: &#x60;greater-or-equal&#x60;, &#x60;greater-than&#x60;, &#x60;less-or-equal&#x60;, &#x60;less-than&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 100. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sorting
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_versions_for_form_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FormsApi.get_versions_for_form ...'
      end
      allowable_values = ["form_type", "ab_test", "ab_test.variation_name", "status", "created_at", "updated_at"]
      if @api_client.config.client_side_validation && opts[:'fields_form_version'] && !opts[:'fields_form_version'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_form_version\", must include one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 100
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling FormsApi.get_versions_for_form, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 1
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling FormsApi.get_versions_for_form, must be greater than or equal to 1.'
      end

      allowable_values = ["created_at", "-created_at", "updated_at", "-updated_at"]
      if @api_client.config.client_side_validation && opts[:'sort'] && !allowable_values.include?(opts[:'sort'])
        fail ArgumentError, "invalid value for \"sort\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/forms/{id}/form-versions'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[form-version]'] = @api_client.build_collection_param(opts[:'fields_form_version'], :csv) if !opts[:'fields_form_version'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'page[cursor]'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?
      query_params[:'page[size]'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'sort'] = opts[:'sort'] if !opts[:'sort'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-10-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.api+json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"FormsApi.get_versions_for_form",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FormsApi#get_versions_for_form\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `get_versions_for_form_with_http_info`
    alias get_form_form_versions_with_http_info get_versions_for_form_with_http_info

    # alias of `get_versions_for_form_with_http_info`
    alias get_form_versions_with_http_info get_versions_for_form_with_http_info
  end
end
