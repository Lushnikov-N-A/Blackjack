require_relative 'deck'
require_relative 'players'
require_relative 'player'
require_relative 'dealer'
d = Deck.new
d.generate_deck
a = []
b = []
a.push(d.cards.sample)
a.push(d.cards.sample)
b.push(d.cards.sample)
b.push(d.cards.sample)
p1 = Player.new("Ivan", 100, a)
p2 = Dealer.new(100, b)
p1.draw(d.cards.sample)
p1.open_cards
p2.open_cards
