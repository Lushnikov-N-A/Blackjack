# frozen_string_literal: true

class Players
  attr_reader :name, :bet
  attr_accessor :bankroll, :hand, :points

  def initialize(name, bankroll, hand)
    @name = name
    @bankroll = bankroll
    @hand = hand
    @hand ||= []
  end

  def scoring_points
    @points = 0
    @hand.each do |card|
      @points += card.value
      @points -= 10 if (card.face == 'Ace') && (@points > 21)
    end
    @points
  end

  def open_cards
    i = 0
    puts "Очки игрока #{name}: #{scoring_points}"
    puts "Карты игрока #{name}:"
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
    puts "#{name}: Твой ход, пропускаю!"
  end

  def show_bankroll
    @bankroll
  end
end
