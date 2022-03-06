class Players

  attr_reader :name, :points
  attr_accessor :bank, :cards_on_hand

  def initialize (name, bank, cards_on_hand)
    @name = name
    @bank = bank
    @cards_on_hand = cards_on_hand
    @cards_on_hand ||= []
  end

  def scoring_points
    @points = 0
    @cards_on_hand.each { |card| @points += card.value }
    return @points
  end

  def open_cards
    i = 0
    puts "Cards Player #{self.name}"
    @cards_on_hand.each { |card| puts "Card №#{i += 1}: #{card.face}#{card.suit}, points:#{card.value}" }
    puts "Total points #{scoring_points}"
  end

end
