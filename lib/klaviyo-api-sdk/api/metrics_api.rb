=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2024-05-15
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
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-05-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_metric(id, opts = {})
      data, _status_code, _headers = get_metric_with_http_info(id, opts)
      data
    end

    # Get Metric
    # Get a metric with the given metric ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;metrics:read&#x60;
    # @param id [String] Metric ID
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-05-15/reference/api-overview#sparse-fieldsets
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
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-05-15"
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
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-05-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-05-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;integration.name&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;integration.category&#x60;: &#x60;equals&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-05-15/reference/api-overview#pagination
    # @return [Hash<String, Object>]
    def get_metrics(opts = {})
      data, _status_code, _headers = get_metrics_with_http_info(opts)
      data
    end

    # Get Metrics
    # Get all metrics in an account.  Requests can be filtered by the following fields: integration &#x60;name&#x60;, integration &#x60;category&#x60;  Returns a maximum of 200 results per page.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;metrics:read&#x60;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_metric For more information please visit https://developers.klaviyo.com/en/v2024-05-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-05-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;integration.name&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;integration.category&#x60;: &#x60;equals&#x60;
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-05-15/reference/api-overview#pagination
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
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-05-15"
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
    # Query and aggregate event data associated with a metric, including native Klaviyo metrics, integration-specific metrics, and custom events. Queries must be passed in the JSON body of your `POST` request.  Results can be filtered and grouped by time, event, or profile dimensions.  To learn more about how to use this endpoint, check out our new [Using the Query Metric Aggregates Endpoint guide](https://developers.klaviyo.com/en/docs/using-the-query-metric-aggregates-endpoint).  **Request body parameters** (nested under `attributes`):  * `return_fields`: request specific fields using [sparse fieldsets](https://developers.klaviyo.com/en/reference/api_overview#sparse-fieldsets) * `sort`: sort results by a specified field, such as `\"-timestamp\"` * `page_cursor`: results can be paginated with [cursor-based pagination](https://developers.klaviyo.com/en/reference/api_overview#pagination) * `page_size`: limit the number of returned results per page * `by`: optional attributes used to group by the aggregation function     * When using `by` attributes, an empty `dimensions` response is expected when the counts for the events do not have the associated dimension requested by the set `by` attribute. For example, a query including `\"by\": [\"$flow\"]` will return an empty dimensions response for counts of metrics not associated with a `$flow` * `measurement`: the measurement key supports the following values:     * `\"sum_value\"`: perform a summation of the `_Event Value_`, optionally partitioned over any dimension provided in the `by` field     * `\"count\"`: counts the number of events associated to a metric, optionally partitioned over any dimension provided in the `by` field     * `\"unique\"` counts the number of unique customers associated to a metric, optionally partitioned over any dimension provided in the `by` field * `interval`: aggregation interval, such as `\"hour\"`,`\"day\"`,`\"week\"`, and `\"month\"` * `metric_id`: the metric ID used in the aggregation * `filter`: list of filters for specific fields, must include time range using ISO 8601 format (`\"YYYY-MM-DDTHH:MM:SS.mmmmmm\"`)     * The time range can be filtered by providing a `greater-or-equal` filter on the datetime field, such as `\"greater-or-equal(datetime,2021-07-01T00:00:00)\"` and a `less-than` filter on the same datetime field, such as `\"less-than(datetime,2022-07-01T00:00:00)\"`     * The time range may span a maximum of one year. Time range dates may be set to a maximum of 5 years prior to the current date     * Filter the list of supported aggregate dimensions using the common filter syntax, such as `\"equals(URL,\\\"https://www.klaviyo.com/\\\")\"` * `timezone`: the timezone used when processing the query. Case sensitive. This field is validated against a list of common timezones from the [IANA Time Zone Database](https://www.iana.org/time-zones)     * While the payload accepts a timezone, the response datetimes returned will be in UTC.  For a comprehensive list of native Klaviyo metrics and their associated attributes for grouping and filtering, please refer to the [metrics attributes guide](https://developers.klaviyo.com/en/docs/supported_metrics_and_attributes).<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`  **Scopes:** `metrics:read`
    # @param metric_aggregate_query [MetricAggregateQuery] Retrieve Metric Aggregations
    # @param [Hash] opts the optional parameters
    # @return [Hash<String, Object>]
    def query_metric_aggregates(metric_aggregate_query, opts = {})
      data, _status_code, _headers = query_metric_aggregates_with_http_info(metric_aggregate_query, opts)
      data
    end

    # Query Metric Aggregates
    # Query and aggregate event data associated with a metric, including native Klaviyo metrics, integration-specific metrics, and custom events. Queries must be passed in the JSON body of your &#x60;POST&#x60; request.  Results can be filtered and grouped by time, event, or profile dimensions.  To learn more about how to use this endpoint, check out our new [Using the Query Metric Aggregates Endpoint guide](https://developers.klaviyo.com/en/docs/using-the-query-metric-aggregates-endpoint).  **Request body parameters** (nested under &#x60;attributes&#x60;):  * &#x60;return_fields&#x60;: request specific fields using [sparse fieldsets](https://developers.klaviyo.com/en/reference/api_overview#sparse-fieldsets) * &#x60;sort&#x60;: sort results by a specified field, such as &#x60;\&quot;-timestamp\&quot;&#x60; * &#x60;page_cursor&#x60;: results can be paginated with [cursor-based pagination](https://developers.klaviyo.com/en/reference/api_overview#pagination) * &#x60;page_size&#x60;: limit the number of returned results per page * &#x60;by&#x60;: optional attributes used to group by the aggregation function     * When using &#x60;by&#x60; attributes, an empty &#x60;dimensions&#x60; response is expected when the counts for the events do not have the associated dimension requested by the set &#x60;by&#x60; attribute. For example, a query including &#x60;\&quot;by\&quot;: [\&quot;$flow\&quot;]&#x60; will return an empty dimensions response for counts of metrics not associated with a &#x60;$flow&#x60; * &#x60;measurement&#x60;: the measurement key supports the following values:     * &#x60;\&quot;sum_value\&quot;&#x60;: perform a summation of the &#x60;_Event Value_&#x60;, optionally partitioned over any dimension provided in the &#x60;by&#x60; field     * &#x60;\&quot;count\&quot;&#x60;: counts the number of events associated to a metric, optionally partitioned over any dimension provided in the &#x60;by&#x60; field     * &#x60;\&quot;unique\&quot;&#x60; counts the number of unique customers associated to a metric, optionally partitioned over any dimension provided in the &#x60;by&#x60; field * &#x60;interval&#x60;: aggregation interval, such as &#x60;\&quot;hour\&quot;&#x60;,&#x60;\&quot;day\&quot;&#x60;,&#x60;\&quot;week\&quot;&#x60;, and &#x60;\&quot;month\&quot;&#x60; * &#x60;metric_id&#x60;: the metric ID used in the aggregation * &#x60;filter&#x60;: list of filters for specific fields, must include time range using ISO 8601 format (&#x60;\&quot;YYYY-MM-DDTHH:MM:SS.mmmmmm\&quot;&#x60;)     * The time range can be filtered by providing a &#x60;greater-or-equal&#x60; filter on the datetime field, such as &#x60;\&quot;greater-or-equal(datetime,2021-07-01T00:00:00)\&quot;&#x60; and a &#x60;less-than&#x60; filter on the same datetime field, such as &#x60;\&quot;less-than(datetime,2022-07-01T00:00:00)\&quot;&#x60;     * The time range may span a maximum of one year. Time range dates may be set to a maximum of 5 years prior to the current date     * Filter the list of supported aggregate dimensions using the common filter syntax, such as &#x60;\&quot;equals(URL,\\\&quot;https://www.klaviyo.com/\\\&quot;)\&quot;&#x60; * &#x60;timezone&#x60;: the timezone used when processing the query. Case sensitive. This field is validated against a list of common timezones from the [IANA Time Zone Database](https://www.iana.org/time-zones)     * While the payload accepts a timezone, the response datetimes returned will be in UTC.  For a comprehensive list of native Klaviyo metrics and their associated attributes for grouping and filtering, please refer to the [metrics attributes guide](https://developers.klaviyo.com/en/docs/supported_metrics_and_attributes).&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;3/s&#x60;&lt;br&gt;Steady: &#x60;60/m&#x60;  **Scopes:** &#x60;metrics:read&#x60;
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
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-05-15"
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
  end
end
