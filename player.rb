# frozen_string_literal: true

class Player < Players
  include Validation

  def initialize(name, bankroll, hand)
    @name = name
    validate_name!
    super
  end

  def next_step
    puts 'Ход дилера!'
  end
end
