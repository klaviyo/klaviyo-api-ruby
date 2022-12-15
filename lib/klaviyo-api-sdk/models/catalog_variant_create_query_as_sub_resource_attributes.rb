=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2022-12-09
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.0.1

=end

require 'date'
require 'time'

module KlaviyoAPI
  class CatalogVariantCreateQueryAsSubResourceAttributes
    attr_accessor :external_id

    attr_accessor :catalog_type

    # The integration type. Currently, this can only be set to $custom (and defaults to $custom if not included in the payload).
    attr_accessor :integration_type

    attr_accessor :title

    attr_accessor :description

    attr_accessor :sku

    # A field that controls product visibility in product feeds/blocks. This field has two options:     DENY (1): a product will not appear in dynamic product recommendation feeds and blocks if it is out of stock.     CONTINUE (2): a product can appear in dynamic product recommendation feeds and blocks regardless of inventory quantity.     UNKNOWN (0): the behavior will be the same as if it were set to 2 [Default]
    attr_accessor :inventory_policy

    attr_accessor :inventory_quantity

    attr_accessor :price

    attr_accessor :url

    attr_accessor :image_full_url

    attr_accessor :image_thumbnail_url

    attr_accessor :images

    attr_accessor :custom_metadata

    attr_accessor :published

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'external_id' => :'external_id',
        :'catalog_type' => :'catalog_type',
        :'integration_type' => :'integration_type',
        :'title' => :'title',
        :'description' => :'description',
        :'sku' => :'sku',
        :'inventory_policy' => :'inventory_policy',
        :'inventory_quantity' => :'inventory_quantity',
        :'price' => :'price',
        :'url' => :'url',
        :'image_full_url' => :'image_full_url',
        :'image_thumbnail_url' => :'image_thumbnail_url',
        :'images' => :'images',
        :'custom_metadata' => :'custom_metadata',
        :'published' => :'published'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'external_id' => :'String',
        :'catalog_type' => :'String',
        :'integration_type' => :'String',
        :'title' => :'String',
        :'description' => :'String',
        :'sku' => :'String',
        :'inventory_policy' => :'Integer',
        :'inventory_quantity' => :'Float',
        :'price' => :'Float',
        :'url' => :'String',
        :'image_full_url' => :'String',
        :'image_thumbnail_url' => :'String',
        :'images' => :'Array<String>',
        :'custom_metadata' => :'Object',
        :'published' => :'Boolean'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `KlaviyoAPI::CatalogVariantCreateQueryAsSubResourceAttributes` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `KlaviyoAPI::CatalogVariantCreateQueryAsSubResourceAttributes`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'external_id')
        self.external_id = attributes[:'external_id']
      end

      if attributes.key?(:'catalog_type')
        self.catalog_type = attributes[:'catalog_type']
      else
        self.catalog_type = '$default'
      end

      if attributes.key?(:'integration_type')
        self.integration_type = attributes[:'integration_type']
      end

      if attributes.key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'sku')
        self.sku = attributes[:'sku']
      end

      if attributes.key?(:'inventory_policy')
        self.inventory_policy = attributes[:'inventory_policy']
      end

      if attributes.key?(:'inventory_quantity')
        self.inventory_quantity = attributes[:'inventory_quantity']
      end

      if attributes.key?(:'price')
        self.price = attributes[:'price']
      end

      if attributes.key?(:'url')
        self.url = attributes[:'url']
      end

      if attributes.key?(:'image_full_url')
        self.image_full_url = attributes[:'image_full_url']
      end

      if attributes.key?(:'image_thumbnail_url')
        self.image_thumbnail_url = attributes[:'image_thumbnail_url']
      end

      if attributes.key?(:'images')
        if (value = attributes[:'images']).is_a?(Array)
          self.images = value
        end
      end

      if attributes.key?(:'custom_metadata')
        self.custom_metadata = attributes[:'custom_metadata']
      end

      if attributes.key?(:'published')
        self.published = attributes[:'published']
      else
        self.published = true
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @external_id.nil?
        invalid_properties.push('invalid value for "external_id", external_id cannot be nil.')
      end

      if @title.nil?
        invalid_properties.push('invalid value for "title", title cannot be nil.')
      end

      if @description.nil?
        invalid_properties.push('invalid value for "description", description cannot be nil.')
      end

      if @sku.nil?
        invalid_properties.push('invalid value for "sku", sku cannot be nil.')
      end

      if @inventory_policy.nil?
        invalid_properties.push('invalid value for "inventory_policy", inventory_policy cannot be nil.')
      end

      if @inventory_quantity.nil?
        invalid_properties.push('invalid value for "inventory_quantity", inventory_quantity cannot be nil.')
      end

      if @price.nil?
        invalid_properties.push('invalid value for "price", price cannot be nil.')
      end

      if @url.nil?
        invalid_properties.push('invalid value for "url", url cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @external_id.nil?
      integration_type_validator = EnumAttributeValidator.new('String', ["$custom"])
      return false unless integration_type_validator.valid?(@integration_type)
      return false if @title.nil?
      return false if @description.nil?
      return false if @sku.nil?
      return false if @inventory_policy.nil?
      inventory_policy_validator = EnumAttributeValidator.new('Integer', [0, 1, 2])
      return false unless inventory_policy_validator.valid?(@inventory_policy)
      return false if @inventory_quantity.nil?
      return false if @price.nil?
      return false if @url.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] integration_type Object to be assigned
    def integration_type=(integration_type)
      validator = EnumAttributeValidator.new('String', ["$custom"])
      unless validator.valid?(integration_type)
        fail ArgumentError, "invalid value for \"integration_type\", must be one of #{validator.allowable_values}."
      end
      @integration_type = integration_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] inventory_policy Object to be assigned
    def inventory_policy=(inventory_policy)
      validator = EnumAttributeValidator.new('Integer', [0, 1, 2])
      unless validator.valid?(inventory_policy)
        fail ArgumentError, "invalid value for \"inventory_policy\", must be one of #{validator.allowable_values}."
      end
      @inventory_policy = inventory_policy
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          external_id == o.external_id &&
          catalog_type == o.catalog_type &&
          integration_type == o.integration_type &&
          title == o.title &&
          description == o.description &&
          sku == o.sku &&
          inventory_policy == o.inventory_policy &&
          inventory_quantity == o.inventory_quantity &&
          price == o.price &&
          url == o.url &&
          image_full_url == o.image_full_url &&
          image_thumbnail_url == o.image_thumbnail_url &&
          images == o.images &&
          custom_metadata == o.custom_metadata &&
          published == o.published
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [external_id, catalog_type, integration_type, title, description, sku, inventory_policy, inventory_quantity, price, url, image_full_url, image_thumbnail_url, images, custom_metadata, published].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = KlaviyoAPI.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
