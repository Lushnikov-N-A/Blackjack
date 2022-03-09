class Dealer < Players

  def initialize (name = "Dealer", bankroll, hand)
    super
  end

  def show_carts_dealer
    puts "Карты диллера:"
    (@hand.length).times {print '*'}
    puts
  end

end
