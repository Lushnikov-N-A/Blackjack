class Bank

  attr_accessor :bank
  attr_reader :bank_to_winner, :return_bet
  
  def get_bet(bet)
    @bank ||= 0
    @bank += bet
  end

  def bank_to_winner
    @bank_to_winner = @bank
    @bank -= @bank
    return @bank_to_winner
  end

  def return_bet
    @return_bet = @bank/2
    @bank -= @bank
    return @return_bet
  end
end
