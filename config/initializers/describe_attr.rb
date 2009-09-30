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
  end
  
end