
require_relative 'card'

class Deck

  attr_reader :cards

  def initialize
      @faces = [*(2..10), 'jack', 'queen', 'king', 'ace']
      @suits = ['♠', '♥', '♦', '♣']
      @cards = []
  end

  def generate_deck
    @suits.each do |suit|
      @faces.each do |face|
        if face.class == Integer
          value = face
        elsif face == 'ace'
          value = 11
        else
          value = 10
        end
      @cards << Card.new(face, suit, value)
      end
    end
    @cards.shuffle!
  end
end
