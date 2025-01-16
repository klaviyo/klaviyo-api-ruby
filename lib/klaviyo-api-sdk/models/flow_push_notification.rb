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
  class FlowPushNotification
    attr_accessor :title

    attr_accessor :body

    attr_accessor :sound

    attr_accessor :badge

    # The id of an ImageAsset. If provided, this will take precedence over a dynamic_image.
    attr_accessor :image_id

    # A dynamic image asset to include in the push notification.
    attr_accessor :dynamic_image

    # See PushLinkAction in app.  This is not a flow action, but the literal action that should be taken when the push notification is tapped.
    attr_accessor :on_open

    attr_accessor :ios_link

    attr_accessor :android_link

    attr_accessor :conversion_metric_id

    attr_accessor :smart_sending_enabled

    attr_accessor :additional_filters

    attr_accessor :name

    attr_accessor :id

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
        :'title' => :'title',
        :'body' => :'body',
        :'sound' => :'sound',
        :'badge' => :'badge',
        :'image_id' => :'image_id',
        :'dynamic_image' => :'dynamic_image',
        :'on_open' => :'on_open',
        :'ios_link' => :'ios_link',
        :'android_link' => :'android_link',
        :'conversion_metric_id' => :'conversion_metric_id',
        :'smart_sending_enabled' => :'smart_sending_enabled',
        :'additional_filters' => :'additional_filters',
        :'name' => :'name',
        :'id' => :'id'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'title' => :'String',
        :'body' => :'String',
        :'sound' => :'Boolean',
        :'badge' => :'Boolean',
        :'image_id' => :'String',
        :'dynamic_image' => :'String',
        :'on_open' => :'String',
        :'ios_link' => :'String',
        :'android_link' => :'String',
        :'conversion_metric_id' => :'String',
        :'smart_sending_enabled' => :'Boolean',
        :'additional_filters' => :'UnionFilter',
        :'name' => :'String',
        :'id' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'title',
        :'image_id',
        :'dynamic_image',
        :'ios_link',
        :'android_link',
        :'conversion_metric_id',
        :'name',
        :'id'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `KlaviyoAPI::FlowPushNotification` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `KlaviyoAPI::FlowPushNotification`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.key?(:'body')
        self.body = attributes[:'body']
      end

      if attributes.key?(:'sound')
        self.sound = attributes[:'sound']
      else
        self.sound = false
      end

      if attributes.key?(:'badge')
        self.badge = attributes[:'badge']
      else
        self.badge = false
      end

      if attributes.key?(:'image_id')
        self.image_id = attributes[:'image_id']
      end

      if attributes.key?(:'dynamic_image')
        self.dynamic_image = attributes[:'dynamic_image']
      end

      if attributes.key?(:'on_open')
        self.on_open = attributes[:'on_open']
      else
        self.on_open = 'home'
      end

      if attributes.key?(:'ios_link')
        self.ios_link = attributes[:'ios_link']
      end

      if attributes.key?(:'android_link')
        self.android_link = attributes[:'android_link']
      end

      if attributes.key?(:'conversion_metric_id')
        self.conversion_metric_id = attributes[:'conversion_metric_id']
      end

      if attributes.key?(:'smart_sending_enabled')
        self.smart_sending_enabled = attributes[:'smart_sending_enabled']
      else
        self.smart_sending_enabled = true
      end

      if attributes.key?(:'additional_filters')
        self.additional_filters = attributes[:'additional_filters']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @body.nil?
        invalid_properties.push('invalid value for "body", body cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @body.nil?
      on_open_validator = EnumAttributeValidator.new('String', ["home", "link"])
      return false unless on_open_validator.valid?(@on_open)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] on_open Object to be assigned
    def on_open=(on_open)
      validator = EnumAttributeValidator.new('String', ["home", "link"])
      unless validator.valid?(on_open)
        fail ArgumentError, "invalid value for \"on_open\", must be one of #{validator.allowable_values}."
      end
      @on_open = on_open
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          title == o.title &&
          body == o.body &&
          sound == o.sound &&
          badge == o.badge &&
          image_id == o.image_id &&
          dynamic_image == o.dynamic_image &&
          on_open == o.on_open &&
          ios_link == o.ios_link &&
          android_link == o.android_link &&
          conversion_metric_id == o.conversion_metric_id &&
          smart_sending_enabled == o.smart_sending_enabled &&
          additional_filters == o.additional_filters &&
          name == o.name &&
          id == o.id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [title, body, sound, badge, image_id, dynamic_image, on_open, ios_link, android_link, conversion_metric_id, smart_sending_enabled, additional_filters, name, id].hash
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
