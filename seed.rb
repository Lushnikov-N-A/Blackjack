require_relative 'validation'
require_relative 'deck'
require_relative 'card'
require_relative 'players'
require_relative 'player'
require_relative 'dealer'
d = Deck.new
d.generate_deck
a = []
b = []
a.push(d.gets_card)
a.push(d.gets_card)
b.push(d.gets_card)
b.push(d.gets_card)
p1 = Player.new("Ivan", 100, a)
p1 = Player.new("Ivan", 100, a)
p2 = Dealer.new(100, b)
p1.draw(d.gets_card)
p1.open_cards
p2.show_cards_dealer

p1.open_cards
a.push(card1)
a.push(card)
a.push(card)
card1 = Card.new('Jack', '♠', 10)
card = Card.new('Ace', '♠', 11)
