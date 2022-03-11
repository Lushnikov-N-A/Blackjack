# frozen_string_literal: true

class Dealer < Players
  def initialize(name = 'Dealer', bankroll, hand)
    super
  end

  def show_cards_dealer
    puts 'Карты диллера:'
    @hand.length.times { print '*' }
    puts
  end

  def next_step
    puts 'Ход игрока!'
  end
end
