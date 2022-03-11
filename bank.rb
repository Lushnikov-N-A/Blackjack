# frozen_string_literal: true

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
    @bank_to_winner
  end

  def return_bet
    @return_bet = @bank / 2
    @bank -= @bank
    @return_bet
  end

  def show_bank
    @bank
  end
end
