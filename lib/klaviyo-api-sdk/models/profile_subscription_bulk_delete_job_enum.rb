=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2023-10-15
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'date'
require 'time'

module KlaviyoAPI
  class ProfileSubscriptionBulkDeleteJobEnum
    PROFILE_SUBSCRIPTION_BULK_DELETE_JOB = "profile-subscription-bulk-delete-job".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = ProfileSubscriptionBulkDeleteJobEnum.constants.select { |c| ProfileSubscriptionBulkDeleteJobEnum::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #ProfileSubscriptionBulkDeleteJobEnum" if constantValues.empty?
      value
    end
  end
end
