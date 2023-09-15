=begin
#Klaviyo API

#The Klaviyo REST API. Please visit https://developers.klaviyo.com for more details.

The version of the OpenAPI document: 2023-09-15
Contact: developers@klaviyo.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'date'
require 'time'

module KlaviyoAPI
  class DeviceMetadata
    # Relatively stable ID for the device. Will update on app uninstall and reinstall
    attr_accessor :device_id

    # The name of the SDK used to create the push token.
    attr_accessor :klaviyo_sdk

    # The version of the SDK used to create the push token
    attr_accessor :sdk_version

    # The model of the device
    attr_accessor :device_model

    # The name of the operating system on the device.
    attr_accessor :os_name

    # The version of the operating system on the device
    attr_accessor :os_version

    # The manufacturer of the device
    attr_accessor :manufacturer

    # The name of the app that created the push token
    attr_accessor :app_name

    # The version of the app that created the push token
    attr_accessor :app_version

    # The build of the app that created the push token
    attr_accessor :app_build

    # The ID of the app that created the push token
    attr_accessor :app_id

    # The environment in which the push token was created
    attr_accessor :environment

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
        :'device_id' => :'device_id',
        :'klaviyo_sdk' => :'klaviyo_sdk',
        :'sdk_version' => :'sdk_version',
        :'device_model' => :'device_model',
        :'os_name' => :'os_name',
        :'os_version' => :'os_version',
        :'manufacturer' => :'manufacturer',
        :'app_name' => :'app_name',
        :'app_version' => :'app_version',
        :'app_build' => :'app_build',
        :'app_id' => :'app_id',
        :'environment' => :'environment'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'device_id' => :'String',
        :'klaviyo_sdk' => :'String',
        :'sdk_version' => :'String',
        :'device_model' => :'String',
        :'os_name' => :'String',
        :'os_version' => :'String',
        :'manufacturer' => :'String',
        :'app_name' => :'String',
        :'app_version' => :'String',
        :'app_build' => :'String',
        :'app_id' => :'String',
        :'environment' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `KlaviyoAPI::DeviceMetadata` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `KlaviyoAPI::DeviceMetadata`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'device_id')
        self.device_id = attributes[:'device_id']
      end

      if attributes.key?(:'klaviyo_sdk')
        self.klaviyo_sdk = attributes[:'klaviyo_sdk']
      end

      if attributes.key?(:'sdk_version')
        self.sdk_version = attributes[:'sdk_version']
      end

      if attributes.key?(:'device_model')
        self.device_model = attributes[:'device_model']
      end

      if attributes.key?(:'os_name')
        self.os_name = attributes[:'os_name']
      end

      if attributes.key?(:'os_version')
        self.os_version = attributes[:'os_version']
      end

      if attributes.key?(:'manufacturer')
        self.manufacturer = attributes[:'manufacturer']
      end

      if attributes.key?(:'app_name')
        self.app_name = attributes[:'app_name']
      end

      if attributes.key?(:'app_version')
        self.app_version = attributes[:'app_version']
      end

      if attributes.key?(:'app_build')
        self.app_build = attributes[:'app_build']
      end

      if attributes.key?(:'app_id')
        self.app_id = attributes[:'app_id']
      end

      if attributes.key?(:'environment')
        self.environment = attributes[:'environment']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      klaviyo_sdk_validator = EnumAttributeValidator.new('String', ["android", "swift"])
      return false unless klaviyo_sdk_validator.valid?(@klaviyo_sdk)
      os_name_validator = EnumAttributeValidator.new('String', ["android", "ios", "ipados", "macos", "tvos"])
      return false unless os_name_validator.valid?(@os_name)
      environment_validator = EnumAttributeValidator.new('String', ["debug", "release"])
      return false unless environment_validator.valid?(@environment)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] klaviyo_sdk Object to be assigned
    def klaviyo_sdk=(klaviyo_sdk)
      validator = EnumAttributeValidator.new('String', ["android", "swift"])
      unless validator.valid?(klaviyo_sdk)
        fail ArgumentError, "invalid value for \"klaviyo_sdk\", must be one of #{validator.allowable_values}."
      end
      @klaviyo_sdk = klaviyo_sdk
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] os_name Object to be assigned
    def os_name=(os_name)
      validator = EnumAttributeValidator.new('String', ["android", "ios", "ipados", "macos", "tvos"])
      unless validator.valid?(os_name)
        fail ArgumentError, "invalid value for \"os_name\", must be one of #{validator.allowable_values}."
      end
      @os_name = os_name
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] environment Object to be assigned
    def environment=(environment)
      validator = EnumAttributeValidator.new('String', ["debug", "release"])
      unless validator.valid?(environment)
        fail ArgumentError, "invalid value for \"environment\", must be one of #{validator.allowable_values}."
      end
      @environment = environment
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          device_id == o.device_id &&
          klaviyo_sdk == o.klaviyo_sdk &&
          sdk_version == o.sdk_version &&
          device_model == o.device_model &&
          os_name == o.os_name &&
          os_version == o.os_version &&
          manufacturer == o.manufacturer &&
          app_name == o.app_name &&
          app_version == o.app_version &&
          app_build == o.app_build &&
          app_id == o.app_id &&
          environment == o.environment
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [device_id, klaviyo_sdk, sdk_version, device_model, os_name, os_version, manufacturer, app_name, app_version, app_build, app_id, environment].hash
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
