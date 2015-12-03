require_relative 'go_fish'
require_relative 'deck'

require 'pry'

deck  = build_deck

player_1, player_2 = deal_cards!( deck )

until game_over?(deck, player_1, player_2 ) do
  puts 'Player 1 says: Do you have any?'
  round( deck, player_1, player_2 )
  puts 'Player 2 says: Do you have any?'
  round( deck, player_2, player_1 )
end

puts 'the deck ran out' unless deck.any?
puts 'player_1 wins' unless player_1.any?
puts 'player_2 wins' unless player_2.any?
