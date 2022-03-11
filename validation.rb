# frozen_string_literal: true

module Validation
  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    attr_reader :errors

    def validate_name!
      @errors = []
      @errors << 'У игрока должно быть имя!' if @name == ''
      unless @errors.empty?
        puts @errors
        raise @errors
      end
    end

    def valid?
      validate_name!
      true
    rescue StandardError
      false
    end
  end
end
