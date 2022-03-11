# frozen_string_literal: true

class Card
  attr_accessor :face, :suit, :value

  def initialize(face, suit, value)
    @face = face
    @suit = suit
    @value = value
  end
end
