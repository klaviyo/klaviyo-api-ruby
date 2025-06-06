=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'date'
require 'time'

module KlaviyoAPI
  class ProfilePostalCodeDistanceEnum
    PROFILE_POSTAL_CODE_DISTANCE = "profile-postal-code-distance".freeze

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
      constantValues = ProfilePostalCodeDistanceEnum.constants.select { |c| ProfilePostalCodeDistanceEnum::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #ProfilePostalCodeDistanceEnum" if constantValues.empty?
      value
    end
  end
end
