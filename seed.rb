require_relative 'deck'
require_relative 'players'
d = Deck.new
d.generate_deck
a = []
a.push(d.cards.sample)
a.push(d.cards.sample)
p = Players.new("Ivan", 100, a)
p.open_cards
