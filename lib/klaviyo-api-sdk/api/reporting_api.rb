=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module KlaviyoAPI
  class ReportingApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Query Campaign Values
    # Returns the requested campaign analytics values data<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`  **Scopes:** `campaigns:read`
    # @param campaign_values_request_dto [CampaignValuesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2025-07-15/reference/api-overview#pagination
    # @return [Hash<String, Object>]
    def query_campaign_values(campaign_values_request_dto, opts = {})
      data, _status_code, _headers = query_campaign_values_with_http_info(campaign_values_request_dto, opts)
      data
    end

    # alias of `query_campaign_values`
    alias create_campaign_value_report query_campaign_values

    # alias of `query_campaign_values`
    alias create_campaign_values_report query_campaign_values

    # Query Campaign Values
    # Returns the requested campaign analytics values data&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;2/m&#x60;&lt;br&gt;Daily: &#x60;225/d&#x60;  **Scopes:** &#x60;campaigns:read&#x60;
    # @param campaign_values_request_dto [CampaignValuesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2025-07-15/reference/api-overview#pagination
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def query_campaign_values_with_http_info(campaign_values_request_dto, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReportingApi.query_campaign_values ...'
      end
      # verify the required parameter 'campaign_values_request_dto' is set
      if @api_client.config.client_side_validation && campaign_values_request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'campaign_values_request_dto' when calling ReportingApi.query_campaign_values"
      end
      # resource path
      local_var_path = '/api/campaign-values-reports'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'page_cursor'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2025-07-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(campaign_values_request_dto)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"ReportingApi.query_campaign_values",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReportingApi#query_campaign_values\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `query_campaign_values_with_http_info`
    alias create_campaign_value_report_with_http_info query_campaign_values_with_http_info

    # alias of `query_campaign_values_with_http_info`
    alias create_campaign_values_report_with_http_info query_campaign_values_with_http_info

    # Query Flow Series
    # Returns the requested flow analytics series data<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`  **Scopes:** `flows:read`
    # @param flow_series_request_dto [FlowSeriesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2025-07-15/reference/api-overview#pagination
    # @return [Hash<String, Object>]
    def query_flow_series(flow_series_request_dto, opts = {})
      data, _status_code, _headers = query_flow_series_with_http_info(flow_series_request_dto, opts)
      data
    end

    # alias of `query_flow_series`
    alias create_flow_sery_report query_flow_series

    # alias of `query_flow_series`
    alias create_flow_series_report query_flow_series

    # Query Flow Series
    # Returns the requested flow analytics series data&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;2/m&#x60;&lt;br&gt;Daily: &#x60;225/d&#x60;  **Scopes:** &#x60;flows:read&#x60;
    # @param flow_series_request_dto [FlowSeriesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2025-07-15/reference/api-overview#pagination
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def query_flow_series_with_http_info(flow_series_request_dto, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReportingApi.query_flow_series ...'
      end
      # verify the required parameter 'flow_series_request_dto' is set
      if @api_client.config.client_side_validation && flow_series_request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'flow_series_request_dto' when calling ReportingApi.query_flow_series"
      end
      # resource path
      local_var_path = '/api/flow-series-reports'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'page_cursor'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2025-07-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(flow_series_request_dto)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"ReportingApi.query_flow_series",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReportingApi#query_flow_series\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `query_flow_series_with_http_info`
    alias create_flow_sery_report_with_http_info query_flow_series_with_http_info

    # alias of `query_flow_series_with_http_info`
    alias create_flow_series_report_with_http_info query_flow_series_with_http_info

    # Query Flow Values
    # Returns the requested flow analytics values data<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`  **Scopes:** `flows:read`
    # @param flow_values_request_dto [FlowValuesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2025-07-15/reference/api-overview#pagination
    # @return [Hash<String, Object>]
    def query_flow_values(flow_values_request_dto, opts = {})
      data, _status_code, _headers = query_flow_values_with_http_info(flow_values_request_dto, opts)
      data
    end

    # alias of `query_flow_values`
    alias create_flow_value_report query_flow_values

    # alias of `query_flow_values`
    alias create_flow_values_report query_flow_values

    # Query Flow Values
    # Returns the requested flow analytics values data&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;2/m&#x60;&lt;br&gt;Daily: &#x60;225/d&#x60;  **Scopes:** &#x60;flows:read&#x60;
    # @param flow_values_request_dto [FlowValuesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2025-07-15/reference/api-overview#pagination
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def query_flow_values_with_http_info(flow_values_request_dto, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReportingApi.query_flow_values ...'
      end
      # verify the required parameter 'flow_values_request_dto' is set
      if @api_client.config.client_side_validation && flow_values_request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'flow_values_request_dto' when calling ReportingApi.query_flow_values"
      end
      # resource path
      local_var_path = '/api/flow-values-reports'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'page_cursor'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2025-07-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(flow_values_request_dto)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"ReportingApi.query_flow_values",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReportingApi#query_flow_values\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `query_flow_values_with_http_info`
    alias create_flow_value_report_with_http_info query_flow_values_with_http_info

    # alias of `query_flow_values_with_http_info`
    alias create_flow_values_report_with_http_info query_flow_values_with_http_info

    # Query Form Series
    # Returns the requested form analytics series data.<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`  **Scopes:** `forms:read`
    # @param form_series_request_dto [FormSeriesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def query_form_series(form_series_request_dto, opts = {})
      data, _status_code, _headers = query_form_series_with_http_info(form_series_request_dto, opts)
      data
    end

    # alias of `query_form_series`
    alias create_form_sery_report query_form_series

    # alias of `query_form_series`
    alias create_form_series_report query_form_series

    # Query Form Series
    # Returns the requested form analytics series data.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;2/m&#x60;&lt;br&gt;Daily: &#x60;225/d&#x60;  **Scopes:** &#x60;forms:read&#x60;
    # @param form_series_request_dto [FormSeriesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def query_form_series_with_http_info(form_series_request_dto, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReportingApi.query_form_series ...'
      end
      # verify the required parameter 'form_series_request_dto' is set
      if @api_client.config.client_side_validation && form_series_request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'form_series_request_dto' when calling ReportingApi.query_form_series"
      end
      # resource path
      local_var_path = '/api/form-series-reports'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2025-07-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(form_series_request_dto)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"ReportingApi.query_form_series",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReportingApi#query_form_series\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `query_form_series_with_http_info`
    alias create_form_sery_report_with_http_info query_form_series_with_http_info

    # alias of `query_form_series_with_http_info`
    alias create_form_series_report_with_http_info query_form_series_with_http_info

    # Query Form Values
    # Returns the requested form analytics values data.<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`  **Scopes:** `forms:read`
    # @param form_values_request_dto [FormValuesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def query_form_values(form_values_request_dto, opts = {})
      data, _status_code, _headers = query_form_values_with_http_info(form_values_request_dto, opts)
      data
    end

    # alias of `query_form_values`
    alias create_form_value_report query_form_values

    # alias of `query_form_values`
    alias create_form_values_report query_form_values

    # Query Form Values
    # Returns the requested form analytics values data.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;2/m&#x60;&lt;br&gt;Daily: &#x60;225/d&#x60;  **Scopes:** &#x60;forms:read&#x60;
    # @param form_values_request_dto [FormValuesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def query_form_values_with_http_info(form_values_request_dto, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReportingApi.query_form_values ...'
      end
      # verify the required parameter 'form_values_request_dto' is set
      if @api_client.config.client_side_validation && form_values_request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'form_values_request_dto' when calling ReportingApi.query_form_values"
      end
      # resource path
      local_var_path = '/api/form-values-reports'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2025-07-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(form_values_request_dto)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"ReportingApi.query_form_values",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReportingApi#query_form_values\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `query_form_values_with_http_info`
    alias create_form_value_report_with_http_info query_form_values_with_http_info

    # alias of `query_form_values_with_http_info`
    alias create_form_values_report_with_http_info query_form_values_with_http_info

    # Query Segment Series
    # Returns the requested segment analytics series data.<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`  **Scopes:** `segments:read`
    # @param segment_series_request_dto [SegmentSeriesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def query_segment_series(segment_series_request_dto, opts = {})
      data, _status_code, _headers = query_segment_series_with_http_info(segment_series_request_dto, opts)
      data
    end

    # alias of `query_segment_series`
    alias create_segment_sery_report query_segment_series

    # alias of `query_segment_series`
    alias create_segment_series_report query_segment_series

    # Query Segment Series
    # Returns the requested segment analytics series data.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;2/m&#x60;&lt;br&gt;Daily: &#x60;225/d&#x60;  **Scopes:** &#x60;segments:read&#x60;
    # @param segment_series_request_dto [SegmentSeriesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def query_segment_series_with_http_info(segment_series_request_dto, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReportingApi.query_segment_series ...'
      end
      # verify the required parameter 'segment_series_request_dto' is set
      if @api_client.config.client_side_validation && segment_series_request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'segment_series_request_dto' when calling ReportingApi.query_segment_series"
      end
      # resource path
      local_var_path = '/api/segment-series-reports'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2025-07-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(segment_series_request_dto)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"ReportingApi.query_segment_series",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReportingApi#query_segment_series\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `query_segment_series_with_http_info`
    alias create_segment_sery_report_with_http_info query_segment_series_with_http_info

    # alias of `query_segment_series_with_http_info`
    alias create_segment_series_report_with_http_info query_segment_series_with_http_info

    # Query Segment Values
    # Returns the requested segment analytics values data.<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`  **Scopes:** `segments:read`
    # @param segment_values_request_dto [SegmentValuesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def query_segment_values(segment_values_request_dto, opts = {})
      data, _status_code, _headers = query_segment_values_with_http_info(segment_values_request_dto, opts)
      data
    end

    # alias of `query_segment_values`
    alias create_segment_value_report query_segment_values

    # alias of `query_segment_values`
    alias create_segment_values_report query_segment_values

    # Query Segment Values
    # Returns the requested segment analytics values data.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;2/m&#x60;&lt;br&gt;Daily: &#x60;225/d&#x60;  **Scopes:** &#x60;segments:read&#x60;
    # @param segment_values_request_dto [SegmentValuesRequestDTO] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def query_segment_values_with_http_info(segment_values_request_dto, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReportingApi.query_segment_values ...'
      end
      # verify the required parameter 'segment_values_request_dto' is set
      if @api_client.config.client_side_validation && segment_values_request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'segment_values_request_dto' when calling ReportingApi.query_segment_values"
      end
      # resource path
      local_var_path = '/api/segment-values-reports'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2025-07-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(segment_values_request_dto)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key', 'OAuth']

      new_options = opts.merge(
        :operation => :"ReportingApi.query_segment_values",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReportingApi#query_segment_values\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `query_segment_values_with_http_info`
    alias create_segment_value_report_with_http_info query_segment_values_with_http_info

    # alias of `query_segment_values_with_http_info`
    alias create_segment_values_report_with_http_info query_segment_values_with_http_info
  end
end
