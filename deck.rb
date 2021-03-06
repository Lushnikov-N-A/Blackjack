# frozen_string_literal: true

class Deck
  attr_reader :cards, :card

  def initialize
    @faces = [*(2..10), 'Jack', 'Queen', 'King', 'Ace']
    @suits = ['♠', '♥', '♦', '♣']
    @cards = []
  end

  def generate_deck
    @suits.each do |suit|
      @faces.each do |face|
        value = if face.instance_of?(Integer)
                  face
                elsif face == 'Ace'
                  11
                else
                  10
                end
        @cards << Card.new(face, suit, value)
      end
    end
    @cards.shuffle!
  end

  def gets_card
    @card = @cards.sample
    @cards.delete(@card)
    @card
  end
end
