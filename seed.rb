require_relative 'deck'
d = Deck.new
d.generate_deck
d.cards.each do |card|
puts "card #{card.face} #{card.suit} #{card.value}"
end
