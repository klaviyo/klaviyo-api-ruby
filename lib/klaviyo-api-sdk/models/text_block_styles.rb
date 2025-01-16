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
  class TextBlockStyles
    attr_accessor :block_background_color

    attr_accessor :block_border_color

    # Border style.
    attr_accessor :block_border_style

    attr_accessor :block_border_width

    attr_accessor :block_padding_bottom

    attr_accessor :block_padding_left

    attr_accessor :block_padding_right

    attr_accessor :block_padding_top

    attr_accessor :color

    attr_accessor :extra_css_class

    attr_accessor :font_family

    attr_accessor :font_size

    # Font style.
    attr_accessor :font_style

    attr_accessor :font_weight

    attr_accessor :inner_padding_bottom

    attr_accessor :inner_padding_left

    attr_accessor :inner_padding_right

    attr_accessor :inner_padding_top

    attr_accessor :mobile_stretch_content

    attr_accessor :background_color

    attr_accessor :letter_spacing

    attr_accessor :line_height

    # Text Alignment.
    attr_accessor :text_align

    attr_accessor :text_decoration

    # Text table layout.
    attr_accessor :text_table_layout

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
        :'block_background_color' => :'block_background_color',
        :'block_border_color' => :'block_border_color',
        :'block_border_style' => :'block_border_style',
        :'block_border_width' => :'block_border_width',
        :'block_padding_bottom' => :'block_padding_bottom',
        :'block_padding_left' => :'block_padding_left',
        :'block_padding_right' => :'block_padding_right',
        :'block_padding_top' => :'block_padding_top',
        :'color' => :'color',
        :'extra_css_class' => :'extra_css_class',
        :'font_family' => :'font_family',
        :'font_size' => :'font_size',
        :'font_style' => :'font_style',
        :'font_weight' => :'font_weight',
        :'inner_padding_bottom' => :'inner_padding_bottom',
        :'inner_padding_left' => :'inner_padding_left',
        :'inner_padding_right' => :'inner_padding_right',
        :'inner_padding_top' => :'inner_padding_top',
        :'mobile_stretch_content' => :'mobile_stretch_content',
        :'background_color' => :'background_color',
        :'letter_spacing' => :'letter_spacing',
        :'line_height' => :'line_height',
        :'text_align' => :'text_align',
        :'text_decoration' => :'text_decoration',
        :'text_table_layout' => :'text_table_layout'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'block_background_color' => :'String',
        :'block_border_color' => :'String',
        :'block_border_style' => :'String',
        :'block_border_width' => :'Integer',
        :'block_padding_bottom' => :'Integer',
        :'block_padding_left' => :'Integer',
        :'block_padding_right' => :'Integer',
        :'block_padding_top' => :'Integer',
        :'color' => :'String',
        :'extra_css_class' => :'String',
        :'font_family' => :'String',
        :'font_size' => :'Integer',
        :'font_style' => :'String',
        :'font_weight' => :'String',
        :'inner_padding_bottom' => :'Integer',
        :'inner_padding_left' => :'Integer',
        :'inner_padding_right' => :'Integer',
        :'inner_padding_top' => :'Integer',
        :'mobile_stretch_content' => :'Boolean',
        :'background_color' => :'String',
        :'letter_spacing' => :'Integer',
        :'line_height' => :'Float',
        :'text_align' => :'String',
        :'text_decoration' => :'String',
        :'text_table_layout' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'block_background_color',
        :'block_border_color',
        :'block_border_style',
        :'block_border_width',
        :'block_padding_bottom',
        :'block_padding_left',
        :'block_padding_right',
        :'block_padding_top',
        :'color',
        :'extra_css_class',
        :'font_family',
        :'font_size',
        :'font_style',
        :'font_weight',
        :'inner_padding_bottom',
        :'inner_padding_left',
        :'inner_padding_right',
        :'inner_padding_top',
        :'mobile_stretch_content',
        :'background_color',
        :'letter_spacing',
        :'line_height',
        :'text_align',
        :'text_decoration',
        :'text_table_layout'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `KlaviyoAPI::TextBlockStyles` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `KlaviyoAPI::TextBlockStyles`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'block_background_color')
        self.block_background_color = attributes[:'block_background_color']
      end

      if attributes.key?(:'block_border_color')
        self.block_border_color = attributes[:'block_border_color']
      end

      if attributes.key?(:'block_border_style')
        self.block_border_style = attributes[:'block_border_style']
      end

      if attributes.key?(:'block_border_width')
        self.block_border_width = attributes[:'block_border_width']
      end

      if attributes.key?(:'block_padding_bottom')
        self.block_padding_bottom = attributes[:'block_padding_bottom']
      end

      if attributes.key?(:'block_padding_left')
        self.block_padding_left = attributes[:'block_padding_left']
      end

      if attributes.key?(:'block_padding_right')
        self.block_padding_right = attributes[:'block_padding_right']
      end

      if attributes.key?(:'block_padding_top')
        self.block_padding_top = attributes[:'block_padding_top']
      end

      if attributes.key?(:'color')
        self.color = attributes[:'color']
      end

      if attributes.key?(:'extra_css_class')
        self.extra_css_class = attributes[:'extra_css_class']
      end

      if attributes.key?(:'font_family')
        self.font_family = attributes[:'font_family']
      end

      if attributes.key?(:'font_size')
        self.font_size = attributes[:'font_size']
      end

      if attributes.key?(:'font_style')
        self.font_style = attributes[:'font_style']
      end

      if attributes.key?(:'font_weight')
        self.font_weight = attributes[:'font_weight']
      end

      if attributes.key?(:'inner_padding_bottom')
        self.inner_padding_bottom = attributes[:'inner_padding_bottom']
      end

      if attributes.key?(:'inner_padding_left')
        self.inner_padding_left = attributes[:'inner_padding_left']
      end

      if attributes.key?(:'inner_padding_right')
        self.inner_padding_right = attributes[:'inner_padding_right']
      end

      if attributes.key?(:'inner_padding_top')
        self.inner_padding_top = attributes[:'inner_padding_top']
      end

      if attributes.key?(:'mobile_stretch_content')
        self.mobile_stretch_content = attributes[:'mobile_stretch_content']
      end

      if attributes.key?(:'background_color')
        self.background_color = attributes[:'background_color']
      end

      if attributes.key?(:'letter_spacing')
        self.letter_spacing = attributes[:'letter_spacing']
      end

      if attributes.key?(:'line_height')
        self.line_height = attributes[:'line_height']
      end

      if attributes.key?(:'text_align')
        self.text_align = attributes[:'text_align']
      end

      if attributes.key?(:'text_decoration')
        self.text_decoration = attributes[:'text_decoration']
      end

      if attributes.key?(:'text_table_layout')
        self.text_table_layout = attributes[:'text_table_layout']
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
      block_border_style_validator = EnumAttributeValidator.new('String', ["dashed", "dotted", "groove", "inset", "none", "outset", "ridge", "solid"])
      return false unless block_border_style_validator.valid?(@block_border_style)
      font_style_validator = EnumAttributeValidator.new('String', ["italic", "normal"])
      return false unless font_style_validator.valid?(@font_style)
      text_align_validator = EnumAttributeValidator.new('String', ["center", "left", "right"])
      return false unless text_align_validator.valid?(@text_align)
      text_table_layout_validator = EnumAttributeValidator.new('String', ["auto", "fixed", "inherit", "initial"])
      return false unless text_table_layout_validator.valid?(@text_table_layout)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] block_border_style Object to be assigned
    def block_border_style=(block_border_style)
      validator = EnumAttributeValidator.new('String', ["dashed", "dotted", "groove", "inset", "none", "outset", "ridge", "solid"])
      unless validator.valid?(block_border_style)
        fail ArgumentError, "invalid value for \"block_border_style\", must be one of #{validator.allowable_values}."
      end
      @block_border_style = block_border_style
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] font_style Object to be assigned
    def font_style=(font_style)
      validator = EnumAttributeValidator.new('String', ["italic", "normal"])
      unless validator.valid?(font_style)
        fail ArgumentError, "invalid value for \"font_style\", must be one of #{validator.allowable_values}."
      end
      @font_style = font_style
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] text_align Object to be assigned
    def text_align=(text_align)
      validator = EnumAttributeValidator.new('String', ["center", "left", "right"])
      unless validator.valid?(text_align)
        fail ArgumentError, "invalid value for \"text_align\", must be one of #{validator.allowable_values}."
      end
      @text_align = text_align
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] text_table_layout Object to be assigned
    def text_table_layout=(text_table_layout)
      validator = EnumAttributeValidator.new('String', ["auto", "fixed", "inherit", "initial"])
      unless validator.valid?(text_table_layout)
        fail ArgumentError, "invalid value for \"text_table_layout\", must be one of #{validator.allowable_values}."
      end
      @text_table_layout = text_table_layout
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          block_background_color == o.block_background_color &&
          block_border_color == o.block_border_color &&
          block_border_style == o.block_border_style &&
          block_border_width == o.block_border_width &&
          block_padding_bottom == o.block_padding_bottom &&
          block_padding_left == o.block_padding_left &&
          block_padding_right == o.block_padding_right &&
          block_padding_top == o.block_padding_top &&
          color == o.color &&
          extra_css_class == o.extra_css_class &&
          font_family == o.font_family &&
          font_size == o.font_size &&
          font_style == o.font_style &&
          font_weight == o.font_weight &&
          inner_padding_bottom == o.inner_padding_bottom &&
          inner_padding_left == o.inner_padding_left &&
          inner_padding_right == o.inner_padding_right &&
          inner_padding_top == o.inner_padding_top &&
          mobile_stretch_content == o.mobile_stretch_content &&
          background_color == o.background_color &&
          letter_spacing == o.letter_spacing &&
          line_height == o.line_height &&
          text_align == o.text_align &&
          text_decoration == o.text_decoration &&
          text_table_layout == o.text_table_layout
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [block_background_color, block_border_color, block_border_style, block_border_width, block_padding_bottom, block_padding_left, block_padding_right, block_padding_top, color, extra_css_class, font_family, font_size, font_style, font_weight, inner_padding_bottom, inner_padding_left, inner_padding_right, inner_padding_top, mobile_stretch_content, background_color, letter_spacing, line_height, text_align, text_decoration, text_table_layout].hash
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
