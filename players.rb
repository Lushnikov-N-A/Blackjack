class Players

  attr_reader :name
  attr_accessor :bankroll , :hand, :points

  def initialize (name, bankroll, hand)
    @name = name
    @bankroll  = bankroll
    @hand = hand
    @hand ||= []
  end

  def scoring_points
    @points = 0
    @hand.each { |card| @points += card.value }
    return @points
  end

  def open_cards
    i = 0
    puts "Cards Player #{self.name}"
    @hand.each { |card| puts "Card №#{i += 1}: #{card.face}#{card.suit}, points:#{card.value}" }
    puts "Total points #{scoring_points}"
  end

  def draw(card)
    @hand.push(card)
  end

  def pass
    puts "Your turn!"
  end

end
