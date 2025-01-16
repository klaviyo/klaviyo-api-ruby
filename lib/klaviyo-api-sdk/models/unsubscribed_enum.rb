=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2025-01-15
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'date'
require 'time'

module KlaviyoAPI
  class UnsubscribedEnum
    UNSUBSCRIBED = "unsubscribed".freeze

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
      constantValues = UnsubscribedEnum.constants.select { |c| UnsubscribedEnum::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #UnsubscribedEnum" if constantValues.empty?
      value
    end
  end
end
