module Validation
  def self.included(base)
  base.send :include, InstanceMethods
  end

  module InstanceMethods
    attr_reader :errors
    def validate_name!
      @errors = []
      if (@name == '')
        @errors << "У игрока должно быть имя!"
      end
      unless @errors.empty?
        puts @errors
        raise RuntimeError, @errors
      end
    end

    def valid?
      validate_name!
      true
      rescue
      false
    end
  end
end
