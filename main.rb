require_relative 'validation'
require_relative 'bank'
require_relative 'deck'
require_relative 'card'
require_relative 'players'
require_relative 'player'
require_relative 'dealer'

def start_game
  puts "Игра Blackjack!"
  puts "Введите имя игрока:"
  @name_player = gets.chomp.to_s
  @human = Player.new(@name_player, 100, [])
  @dealer = Dealer.new(100, [])
  @deck = Deck.new
  @deck.generate_deck
  @bank = Bank.new
end

def do_bet
  @bank.get_bet(@human.place_bet)
  @bank.get_bet(@dealer.place_bet)
end

def deal_cards
  @human.draw(@deck.gets_card)
  @dealer.draw(@deck.gets_card)
end

def step_dealer
  if (@dealer.scoring_points <= 17) && (@dealer.hand.length < 3)
    @dealer.draw(@deck.gets_card)
    @dealer.show_cards_dealer
    @dealer.next_step
  else
    @dealer.pass
    @dealer.show_cards_dealer
  end
end

def open_all_cards
  @human.open_cards
  @dealer.open_cards
end

def complete_card?
  if (@human.hand.length == 3) && (@dealer.hand.length == 3)
    puts "У игроков по 3 карты, карты вскрываются!"
    winner(@human, @dealer)
    true
  end
end

def distribution_bank
  if @win_id == 2
    @dealer.bankroll += @bank.bank_to_winner
  elsif @win_id == 1
    @human.bankroll += @bank.bank_to_winner
  else
    return_bet = @bank.return_bet
    @human.bankroll += return_bet
    @dealer.bankroll += return_bet
  end
  puts "Банк игрока #{@human.name} = #{@human.show_bankroll}"
  puts "Банк игрока #{@dealer.name} = #{@dealer.show_bankroll}"
end

def winner(player1, player2)
  if (@human.scoring_points > @dealer.scoring_points) && (@human.scoring_points <= 21)
    puts "Выйграл игрок #{@human.name}"
    @win_id = 1
  elsif (@dealer.scoring_points > @human.scoring_points) && (@dealer.scoring_points <= 21)
    puts "Выйграл игрок #{@dealer.name}"
    @win_id = 2
  elsif (@dealer.scoring_points > 21) && (@human.scoring_points <= 21)
    puts "Выйграл игрок #{@human.name}"
    @win_id = 1
  elsif (@human.scoring_points > 21) && (@dealer.scoring_points <= 21)
    puts "Выйграл игрок #{@dealer.name}"
    @win_id = 2
  else
    puts "Ничья."
    @win_id = 0
  end
end

start_game
game_loop = 1
while game_loop == 1 do
  do_bet
  2.times do
    deal_cards
  end
  @human.open_cards
  @dealer.show_cards_dealer
  @dealer.next_step
  puts '1. Взять карту.'
  puts '2. Пропустить ход.'
  choice = gets.chomp.to_i
  puts ''
  case choice
  when 1
    @human.draw(@deck.gets_card)
    @human.open_cards
    @human.next_step
    step_dealer
    if complete_card? == true
      open_all_cards
      winner(@human, @dealer)
      distribution_bank
    else
      puts '1. Открыть карты.'
      puts '2. Пропустить ход.'
      choice = gets.chomp.to_i
      puts ''
      case choice
      when 1
        open_all_cards
        winner(@human, @dealer)
        distribution_bank
      when 2
        @human.open_cards
        @human.next_step
        step_dealer
        @dealer.next_step
        puts 'Открываем карты.'
        open_all_cards
        winner(@human, @dealer)
        distribution_bank
      end
    end
  when 2
    @human.pass
    step_dealer
    puts '1. Взять карту.'
    puts '2. Открыть карты.'
    choice = gets.chomp.to_i
    puts ''
    case choice
    when 1
      @human.draw(@deck.gets_card)
      @human.open_cards
      if complete_card? == true
        open_all_cards
        winner(@human, @dealer)
        distribution_bank
      else
        puts 'Открываем карты.'
        open_all_cards
        winner(@human, @dealer)
        distribution_bank
      end
    when 2
      open_all_cards
      winner(@human, @dealer)
      distribution_bank
    end
  end
  puts "Играем еще раз? если да, введите: '1'!"
  puts "Для выхода введите что угодно!"
  game_loop = gets.chomp.to_i
  @dealer.hand = []
  @human.hand = []
  if game_loop != 1
    puts "Игра завершена!"
    break
  end
end
