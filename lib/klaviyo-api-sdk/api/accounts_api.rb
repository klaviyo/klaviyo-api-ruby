=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2024-06-15
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module KlaviyoAPI
  class AccountsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get Account
    # Retrieve a single account object by its account ID. You can only request the account by which the private API key was generated.<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `15/m`  **Scopes:** `accounts:read`
    # @param id [String] The ID of the account
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_account For more information please visit https://developers.klaviyo.com/en/v2024-06-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_account(id, opts = {})
      data, _status_code, _headers = get_account_with_http_info(id, opts)
      data
    end

    # Get Account
    # Retrieve a single account object by its account ID. You can only request the account by which the private API key was generated.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;15/m&#x60;  **Scopes:** &#x60;accounts:read&#x60;
    # @param id [String] The ID of the account
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_account For more information please visit https://developers.klaviyo.com/en/v2024-06-15/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_account_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountsApi.get_account ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling AccountsApi.get_account"
      end
      allowable_values = ["test_account", "contact_information", "contact_information.default_sender_name", "contact_information.default_sender_email", "contact_information.website_url", "contact_information.organization_name", "contact_information.street_address", "contact_information.street_address.address1", "contact_information.street_address.address2", "contact_information.street_address.city", "contact_information.street_address.region", "contact_information.street_address.country", "contact_information.street_address.zip", "industry", "timezone", "preferred_currency", "public_api_key", "locale"]
      if @api_client.config.client_side_validation && opts[:'fields_account'] && !opts[:'fields_account'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_account\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/accounts/{id}/'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[account]'] = @api_client.build_collection_param(opts[:'fields_account'], :csv) if !opts[:'fields_account'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-06-15"
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
        :operation => :"AccountsApi.get_account",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountsApi#get_account\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Accounts
    # Retrieve the account(s) associated with a given private API key. This will return 1 account object within the array.  You can use this to retrieve account-specific data (contact information, timezone, currency, Public API key, etc.) or test if a Private API Key belongs to the correct account prior to performing subsequent actions with the API.<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `15/m`  **Scopes:** `accounts:read`
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_account For more information please visit https://developers.klaviyo.com/en/v2024-06-15/reference/api-overview#sparse-fieldsets
    # @return [Hash<String, Object>]
    def get_accounts(opts = {})
      data, _status_code, _headers = get_accounts_with_http_info(opts)
      data
    end

    # Get Accounts
    # Retrieve the account(s) associated with a given private API key. This will return 1 account object within the array.  You can use this to retrieve account-specific data (contact information, timezone, currency, Public API key, etc.) or test if a Private API Key belongs to the correct account prior to performing subsequent actions with the API.&lt;br&gt;&lt;br&gt;*Rate limits*:&lt;br&gt;Burst: &#x60;1/s&#x60;&lt;br&gt;Steady: &#x60;15/m&#x60;  **Scopes:** &#x60;accounts:read&#x60;
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields_account For more information please visit https://developers.klaviyo.com/en/v2024-06-15/reference/api-overview#sparse-fieldsets
    # @return [Array<(Hash<String, Object>, Integer, Hash)>] Hash<String, Object> data, response status code and response headers
    def get_accounts_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountsApi.get_accounts ...'
      end
      allowable_values = ["test_account", "contact_information", "contact_information.default_sender_name", "contact_information.default_sender_email", "contact_information.website_url", "contact_information.organization_name", "contact_information.street_address", "contact_information.street_address.address1", "contact_information.street_address.address2", "contact_information.street_address.city", "contact_information.street_address.region", "contact_information.street_address.country", "contact_information.street_address.zip", "industry", "timezone", "preferred_currency", "public_api_key", "locale"]
      if @api_client.config.client_side_validation && opts[:'fields_account'] && !opts[:'fields_account'].all? { |item| allowable_values.include?(item) }
        fail ArgumentError, "invalid value for \"fields_account\", must include one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/accounts/'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'fields[account]'] = @api_client.build_collection_param(opts[:'fields_account'], :csv) if !opts[:'fields_account'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # klaviyo api revision
      header_params['revision'] =  ENV['KLAVIYO_API_REVISION'] || ENV['API_REVISION'] || "2024-06-15"
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
        :operation => :"AccountsApi.get_accounts",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountsApi#get_accounts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
