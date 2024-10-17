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
  class ReviewsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get Review
    # Get the review with the given ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `reviews:read`
    # @param id [String] The ID of the review
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_review For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#relationships
    # @return [Hash<String, Object>]
    def get_review(id, opts = {})
      data, _status_code, _headers = get_review_with_http_info(id, opts)
      data
    end

    # Get Review
    # Get the review with the given ID.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;reviews:read&#x60;
    # @param id [String] The ID of the review
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_review For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#relationships
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_review_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReviewsApi.get_review ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ReviewsApi.get_review"
      end
      allowable_values = ["timestamp", "event_properties", "datetime", "uuid"]
      if @api_client.config.client_side_validation && opts[:'fields_event'] && !opts[:'fields_event'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_event\", must include one of #{allowable_values}"
      end
      allowable_values = ["email", "status", "verified", "review_type", "created", "updated", "images", "product", "product.url", "product.name", "product.image_url", "rating", "author", "content", "title", "smart_quote", "public_reply", "public_reply.content", "public_reply.author", "public_reply.updated"]
      if @api_client.config.client_side_validation && opts[:'fields_review'] && !opts[:'fields_review'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_review\", must include one of #{allowable_values}"
      end
      allowable_values = ["events"]
      if @api_client.config.client_side_validation && opts[:'include'] && !opts[:'include'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"include\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/reviews/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[event]'] = @api_client.build_collection_param(opts[:'fields_event'], :csv) if !opts[:'fields_event'].nil?
      query_params[:'fields[review]'] = @api_client.build_collection_param(opts[:'fields_review'], :csv) if !opts[:'fields_review'].nil?
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
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"ReviewsApi.get_review",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReviewsApi#get_review\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Reviews
    # Get all reviews.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`  **Scopes:** `reviews:read`
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_review For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;created&#x60;: &#x60;greater-or-equal&#x60;, &#x60;less-or-equal&#x60;&lt;br&gt;&#x60;rating&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;, &#x60;greater-or-equal&#x60;, &#x60;less-or-equal&#x60;&lt;br&gt;&#x60;id&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;item.id&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;content&#x60;: &#x60;contains&#x60;&lt;br&gt;&#x60;status&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;review_type&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;verified&#x60;: &#x60;equals&#x60;
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#relationships
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 100. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sorting
    # @return [Hash<String, Object>]
    def get_reviews(opts = {})
      data, _status_code, _headers = get_reviews_with_http_info(opts)
      data
    end

    # Get Reviews
    # Get all reviews.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;10/s&#x60;&lt;br&gt;Steady: &#x60;150/m&#x60;  **Scopes:** &#x60;reviews:read&#x60;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_event For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [Array<String>] :fields_review For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sparse-fieldsets
    # @option opts [String] :filter For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#filtering&lt;br&gt;Allowed field(s)/operator(s):&lt;br&gt;&#x60;created&#x60;: &#x60;greater-or-equal&#x60;, &#x60;less-or-equal&#x60;&lt;br&gt;&#x60;rating&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;, &#x60;greater-or-equal&#x60;, &#x60;less-or-equal&#x60;&lt;br&gt;&#x60;id&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;item.id&#x60;: &#x60;any&#x60;, &#x60;equals&#x60;&lt;br&gt;&#x60;content&#x60;: &#x60;contains&#x60;&lt;br&gt;&#x60;status&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;review_type&#x60;: &#x60;equals&#x60;&lt;br&gt;&#x60;verified&#x60;: &#x60;equals&#x60;
    # @option opts [Array<String>] :include For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#relationships
    # @option opts [String] :page_cursor For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#pagination
    # @option opts [Integer] :page_size Default: 20. Min: 1. Max: 100. (default to 20)
    # @option opts [String] :sort For more information please visit https://developers.klaviyo.com/en/v2024-10-15/reference/api-overview#sorting
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_reviews_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReviewsApi.get_reviews ...'
      end
      allowable_values = ["timestamp", "event_properties", "datetime", "uuid"]
      if @api_client.config.client_side_validation && opts[:'fields_event'] && !opts[:'fields_event'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_event\", must include one of #{allowable_values}"
      end
      allowable_values = ["email", "status", "verified", "review_type", "created", "updated", "images", "product", "product.url", "product.name", "product.image_url", "rating", "author", "content", "title", "smart_quote", "public_reply", "public_reply.content", "public_reply.author", "public_reply.updated"]
      if @api_client.config.client_side_validation && opts[:'fields_review'] && !opts[:'fields_review'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_review\", must include one of #{allowable_values}"
      end
      allowable_values = ["events"]
      if @api_client.config.client_side_validation && opts[:'include'] && !opts[:'include'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"include\", must include one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 100
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling ReviewsApi.get_reviews, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 1
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling ReviewsApi.get_reviews, must be greater than or equal to 1.'
      end

      allowable_values = ["created", "-created", "rating", "-rating", "updated", "-updated"]
      if @api_client.config.client_side_validation && opts[:'sort'] && !allowable_values.include?(opts[:'sort'])
        fail ArgumentError, "invalid value for \"sort\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/reviews'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[event]'] = @api_client.build_collection_param(opts[:'fields_event'], :csv) if !opts[:'fields_event'].nil?
      query_params[:'fields[review]'] = @api_client.build_collection_param(opts[:'fields_review'], :csv) if !opts[:'fields_review'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'include'] = @api_client.build_collection_param(opts[:'include'], :csv) if !opts[:'include'].nil?
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
      auth_names = opts[:debug_auth_names] || ['Klaviyo-API-Key']

      new_options = opts.merge(
        :operation => :"ReviewsApi.get_reviews",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReviewsApi#get_reviews\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end