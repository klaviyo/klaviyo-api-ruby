=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2024-07-15
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module KlaviyoAPI
  class MetricsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get Metric
    # Get a metric with the given metric ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `metrics:read`
    # @param id [String] Metric ID
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-07-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_metric(id, opts = {})
      data, _status_code, _headers = get_metric_with_http_info(id, opts)
      data
    end

    # Get Metric
    # Get a metric with the given metric ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;metrics:read&#x60;
    # @param id [String] Metric ID
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-07-15/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_metric_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MetricsApi.get_metric ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling MetricsApi.get_metric"
      end
      allowable_values = ["name", "created", "updated", "integration"]
      if @api_client.config.client_side_validation && opts[:'fields_metric'] && !opts[:'fields_metric'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_metric\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/metrics/{id}/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[metric]'] = @api_client.build_collection_param(opts[:'fields_metric'], :csv) if !opts[:'fields_metric'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-07-15"
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
        :operation => :"MetricsApi.get_metric",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MetricsApi#get_metric\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Metrics
    # Get all metrics in an account.  Requests can be filtered by the following fields: integration `name`, integration `category`  Returns a maximum of 200 results per page.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `metrics:read`
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-07-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-07-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;integration.name&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;integration.category&#x60;: &#x60;equals&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-07-15/reference/api-overview#pagination
    # @return [Hash<String, Object>]
    def get_metrics(opts = {})
      data, _status_code, _headers = get_metrics_with_http_info(opts)
      data
    end

    # Get Metrics
    # Get all metrics in an account.  Requests can be filtered by the following fields: integration &#x60;name&#x60;, integration &#x60;category&#x60;  Returns a maximum of 200 results per page.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;metrics:read&#x60;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-07-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-07-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;integration.name&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;integration.category&#x60;: &#x60;equals&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-07-15/reference/api-overview#pagination
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_metrics_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MetricsApi.get_metrics ...'
      end
      allowable_values = ["name", "created", "updated", "integration"]
      if @api_client.config.client_side_validation && opts[:'fields_metric'] && !opts[:'fields_metric'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_metric\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/metrics/'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[metric]'] = @api_client.build_collection_param(opts[:'fields_metric'], :csv) if !opts[:'fields_metric'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'page[cursor]'] = opts[:'page_cursor'] if !opts[:'page_cursor'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-07-15"
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
        :operation => :"MetricsApi.get_metrics",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MetricsApi#get_metrics\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Query Metric Aggregates
    # Query and aggregate event data associated with a metric, including native Klaviyo metrics, integration-specific metrics, and custom events. Queries must be passed in the JSON body of your `POST` request.  To request campaign and flow performance data that matches the data shown in Klaviyo's UI, we recommend the [Reporting API](https://developers.klaviyo.com/en/reference/reporting_api_overview).  Results can be filtered and grouped by time, event, or profile dimensions.  To learn more about how to use this endpoint, check out our new [Using the Query Metric Aggregates Endpoint guide](https://developers.klaviyo.com/en/docs/using-the-query-metric-aggregates-endpoint).  For a comprehensive list of request body parameters, native Klaviyo metrics, and their associated attributes for grouping and filtering, please refer to the [metrics attributes guide](https://developers.klaviyo.com/en/docs/supported_metrics_and_attributes).<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `metrics:read`
    # @param metric_aggregate_query [MetricAggregateQuery] Retrieve Metric Aggregations
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def query_metric_aggregates(metric_aggregate_query, opts = {})
      data, _status_code, _headers = query_metric_aggregates_with_http_info(metric_aggregate_query, opts)
      data
    end

    # alias of `query_metric_aggregates`
    alias create_metric_aggregate query_metric_aggregates

    # Query Metric Aggregates
    # Query and aggregate event data associated with a metric, including native Klaviyo metrics, integration-specific metrics, and custom events. Queries must be passed in the JSON body of your &#x60;POST&#x60; request.  To request campaign and flow performance data that matches the data shown in Klaviyo&#39;s UI, we recommend the [Reporting API](https://developers.klaviyo.com/en/reference/reporting_api_overview).  Results can be filtered and grouped by time, event, or profile dimensions.  To learn more about how to use this endpoint, check out our new [Using the Query Metric Aggregates Endpoint guide](https://developers.klaviyo.com/en/docs/using-the-query-metric-aggregates-endpoint).  For a comprehensive list of request body parameters, native Klaviyo metrics, and their associated attributes for grouping and filtering, please refer to the [metrics attributes guide](https://developers.klaviyo.com/en/docs/supported_metrics_and_attributes).&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;metrics:read&#x60;
    # @param metric_aggregate_query [MetricAggregateQuery] Retrieve Metric Aggregations
    # @param [Hash] opts the optional parameters
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def query_metric_aggregates_with_http_info(metric_aggregate_query, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: MetricsApi.query_metric_aggregates ...'
      end
      # verify the required parameter 'metric_aggregate_query' is set
      if @api_client.config.client_side_validation && metric_aggregate_query.nil?
        fail ArgumentError, "Missing the required parameter 'metric_aggregate_query' when calling MetricsApi.query_metric_aggregates"
      end
      # resource path
      local_var_path = '/api/metric-aggregates/'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-07-15"
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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(metric_aggregate_query)

      # return_type
      return_type = opts[:debug_return_type] || 'Hash<String, Object>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"MetricsApi.query_metric_aggregates",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: MetricsApi#query_metric_aggregates\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # alias of `query_metric_aggregates_with_http_info`
    alias create_metric_aggregate_with_http_info query_metric_aggregates_with_http_info
  end
end
