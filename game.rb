require_relative 'validation'
require_relative 'bank'
require_relative 'deck'
require_relative 'card'
require_relative 'players'
require_relative 'player'
require_relative 'dealer'

attr_reader :win_ind


def winner(player1, player2)
  if (p1.scoring_points > p2.scoring_points) && (p1.scoring_points <= 21)
    puts "Выйграл игрок #{p1.name}"
    @win_ind = 1
  elsif (p2.scoring_points > p1.scoring_points) && (p2.scoring_points <= 21)
    puts "Выйграл игрок #{p2.name}"
    @win_ind = 2
  elsif (p2.scoring_points > 21) && (p1.scoring_points <= 21)
    puts "Выйграл игрок #{p1.name}"
    @win_ind = 1
  elsif (p1.scoring_points > 21) && (p2.scoring_points <= 21)
    puts "Выйграл игрок #{p2.name}"
    @win_ind = 2
  else
    puts "Ничья"
    @win_ind = 0
  end
end
