class Players

  attr_reader :name, :bet
  attr_accessor :bankroll, :hand, :points

  def initialize (name, bankroll, hand)
    @name = name
    @bankroll  = bankroll
    @hand = hand
    @hand ||= []
  end

  def scoring_points
    @points = 0
    @hand.each do |card|
      @points += card.value
      if (card.face == "Ace") && (@points > 21)
        @points -= 10
      end
    end
    return @points
  end

  def open_cards
    i = 0
    puts "Total points Player #{self.name}: #{scoring_points}"
    puts "Cards Player #{self.name}"
    @hand.each { |card| puts "Card №#{i += 1}: #{card.face}#{card.suit}" }
  end

  def draw(card)
    @hand.push(card)
  end

  def place_bet
    @bet = 10
    self.bankroll -= bet
    @bet
  end

  def pass
    puts "Your turn!"
  end
end
