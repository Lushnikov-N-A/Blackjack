class Bank

  attr_accessor :bank

  def get_bet(bet)
    @bank ||= 0
    @bank += bet
  end

  def bank_to_winner
    @bank
  end
end 
