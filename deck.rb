class Deck

  def initialize
      @faces = [*(2..10), 'jack', 'queen', 'king', 'ace']
      @suit = [♠, ♥, ♦, ♣]
      @cards = []
  end
  
end
