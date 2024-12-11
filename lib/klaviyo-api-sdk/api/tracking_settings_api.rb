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
  class TrackingSettingsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get Tracking Setting
    # Get the tracking setting with the given account ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `tracking-settings:read`
    # @param id [String] The id of the tracking setting (account ID).
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_tracking_setting For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_tracking_setting(id, opts = {})
      data, _status_code, _headers = get_tracking_setting_with_http_info(id, opts)
      data
    end

    # Get Tracking Setting
    # Get the tracking setting with the given account ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;tracking-settings:read&#x60;
    # @param id [String] The id of the tracking setting (account ID).
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_tracking_setting For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_tracking_setting_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TrackingSettingsApi.get_tracking_setting ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TrackingSettingsApi.get_tracking_setting"
      end
      allowable_values = ["auto_add_parameters", "utm_source", "utm_source.flow", "utm_source.flow.type", "utm_source.flow.value", "utm_source.campaign", "utm_source.campaign.type", "utm_source.campaign.value", "utm_medium", "utm_medium.flow", "utm_medium.flow.type", "utm_medium.flow.value", "utm_medium.campaign", "utm_medium.campaign.type", "utm_medium.campaign.value", "utm_campaign", "utm_campaign.flow", "utm_campaign.flow.type", "utm_campaign.flow.value", "utm_campaign.campaign", "utm_campaign.campaign.type", "utm_campaign.campaign.value", "utm_id", "utm_id.flow", "utm_id.flow.type", "utm_id.flow.value", "utm_id.campaign", "utm_id.campaign.type", "utm_id.campaign.value", "utm_term", "utm_term.flow", "utm_term.flow.type", "utm_term.flow.value", "utm_term.campaign", "utm_term.campaign.type", "utm_term.campaign.value", "custom_parameters"]
      if @api_client.config.client_side_validation && opts[:'fields_tracking_setting'] && !opts[:'fields_tracking_setting'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_tracking_setting\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/tracking-settings/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[tracking-setting]'] = @api_client.build_collection_param(opts[:'fields_tracking_setting'], :csv) if !opts[:'fields_tracking_setting'].nil?

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
        :operation => :"TrackingSettingsApi.get_tracking_setting",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TrackingSettingsApi#get_tracking_setting\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Tracking Settings
    # Get all tracking settings in an account. Returns an array with a single tracking setting.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `tracking-settings:read`
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_tracking_setting For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 1. Min: 1. Max: 1. (default to 1)
    # @return [Hash<String, Object>]
    def get_tracking_settings(opts = {})
      data, _status_code, _headers = get_tracking_settings_with_http_info(opts)
      data
    end

    # Get Tracking Settings
    # Get all tracking settings in an account. Returns an array with a single tracking setting.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;tracking-settings:read&#x60;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_tracking_setting For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 1. Min: 1. Max: 1. (default to 1)
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_tracking_settings_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TrackingSettingsApi.get_tracking_settings ...'
      end
      allowable_values = ["auto_add_parameters", "utm_source", "utm_source.flow", "utm_source.flow.type", "utm_source.flow.value", "utm_source.campaign", "utm_source.campaign.type", "utm_source.campaign.value", "utm_medium", "utm_medium.flow", "utm_medium.flow.type", "utm_medium.flow.value", "utm_medium.campaign", "utm_medium.campaign.type", "utm_medium.campaign.value", "utm_campaign", "utm_campaign.flow", "utm_campaign.flow.type", "utm_campaign.flow.value", "utm_campaign.campaign", "utm_campaign.campaign.type", "utm_campaign.campaign.value", "utm_id", "utm_id.flow", "utm_id.flow.type", "utm_id.flow.value", "utm_id.campaign", "utm_id.campaign.type", "utm_id.campaign.value", "utm_term", "utm_term.flow", "utm_term.flow.type", "utm_term.flow.value", "utm_term.campaign", "utm_term.campaign.type", "utm_term.campaign.value", "custom_parameters"]
      if @api_client.config.client_side_validation && opts[:'fields_tracking_setting'] && !opts[:'fields_tracking_setting'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_tracking_setting\", must include one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 1
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling TrackingSettingsApi.get_tracking_settings, must be smaller than or equal to 1.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 1
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling TrackingSettingsApi.get_tracking_settings, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/tracking-settings'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[tracking-setting]'] = @api_client.build_collection_param(opts[:'fields_tracking_setting'], :csv) if !opts[:'fields_tracking_setting'].nil?
      query_params[:'page[cursor]'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?
      query_params[:'page[size]'] = opts[:'page_size'] if !opts[:'page_size'].nil?

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
        :operation => :"TrackingSettingsApi.get_tracking_settings",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TrackingSettingsApi#get_tracking_settings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Tracking Setting
    # Update the tracking setting with the given account ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `tracking-settings:write`
    # @param id [String] The id of the tracking setting (account ID).
    # @param tracking_setting_partial_update_query [TrackingSettingPartialUpdateQuery] DTO for updating tracking settings
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def update_tracking_setting(id, tracking_setting_partial_update_query, opts = {})
      data, _status_code, _headers = update_tracking_setting_with_http_info(id, tracking_setting_partial_update_query, opts)
      data
    end

    # Update Tracking Setting
    # Update the tracking setting with the given account ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;tracking-settings:write&#x60;
    # @param id [String] The id of the tracking setting (account ID).
    # @param tracking_setting_partial_update_query [TrackingSettingPartialUpdateQuery] DTO for updating tracking settings
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def update_tracking_setting_with_http_info(id, tracking_setting_partial_update_query, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TrackingSettingsApi.update_tracking_setting ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TrackingSettingsApi.update_tracking_setting"
      end
      # verify the required parameter 'tracking_setting_partial_update_query' is set
      if @api_client.config.client_side_validation && tracking_setting_partial_update_query.nil?
        fail ArgumentError, "Missing the required parameter 'tracking_setting_partial_update_query' when calling TrackingSettingsApi.update_tracking_setting"
      end
      # resource path
      local_var_path = '/api/tracking-settings/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-10-15"
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/vnd.api+json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/vnd.api+json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(tracking_setting_partial_update_query)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"TrackingSettingsApi.update_tracking_setting",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TrackingSettingsApi#update_tracking_setting\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
