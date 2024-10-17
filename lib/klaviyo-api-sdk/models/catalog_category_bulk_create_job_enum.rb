=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2024-10-15
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'date'
require 'time'

module KlaviyoAPI
  class CatalogCategoryBulkCreateJobEnum
    CATALOG_CATEGORY_BULK_CREATE_JOB = "catalog-category-bulk-create-job".freeze

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
      constantValues = CatalogCategoryBulkCreateJobEnum.constants.select { |c| CatalogCategoryBulkCreateJobEnum::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #CatalogCategoryBulkCreateJobEnum" if constantValues.empty?
      value
    end
  end
end
