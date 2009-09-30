if defined?(ActiveRecord)
  
  # let's us add attribute descriptions to each AR model
  class ActiveRecord::Base
    def self.describe_attr(*params)
      attrs = params.shift
      unless attrs.nil?
        case attrs
          when Hash
            @@attr_descriptions = attrs
          when Symbol
            return @@attr_descriptions[attrs]
        end
      end 
      @@attr_descriptions ||= {}
    end
  
    alias_method '__initialize__', 'initialize'

    def initialize options = nil, &block
      returning( __initialize__(options, &block) ) do
        options ||= {}
        options.to_options!
        attr_descriptions = self.class.attr_descriptions || self.attr_descriptions || Hash.new 
        (attr_descriptions.keys - options.keys).each do |key|
          value = attr_descriptions[key]
          case value
            when Proc
              value = instance_eval &value
            when Symbol
              value = send value 
          end
          send “#{ key }=”, value 
        end
      end
    end

    def self.attr_descriptions *argv
      @attr_descriptions = argv.shift.to_hash if argv.first 
      return @attr_descriptions if defined? @attr_descriptions
    end

    def attr_descriptions *argv
      @attr_descriptions = argv.shift.to_hash if argv.first 
      return @attr_descriptions if defined? @attr_descriptions
    end
    
    def self.attr_description(attribute)
      return @attr_descriptions[attribute]
    end
    
  end
  
end