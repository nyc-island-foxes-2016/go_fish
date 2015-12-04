require_relative 'go_fish'
require_relative 'deck'

require 'pry'

deck  = build_deck

player_1, player_2 = deal_cards!( deck )
player_1_books = []
player_2_books = []


until game_over?( player_1, player_2 ) do
  puts 'Player 1 asks. Do you have any?'
  player_1_books += round( deck, player_1, player_2 )
  break if game_over?( player_1, player_2 )
  puts 'Player 2 asks. Do you have any?'
  player_2_books += round( deck, player_2, player_1 )
end

puts (player_1.length > player_2.length ? 'Player 1 Wins' : 'Player 2 Wins')
