
def do_you_have_any( player_hand, card_number )
  player_hand.select do |card| 
    card[:number] == card_number.to_s
  end
end 

def game_over?(deck, player_1, player_2 )
  player_1.empty? || player_2.empty? || deck.empty?
end

def round(deck, guesser, holder )
  guess_card = guesser.shift

  puts "#{guess_card[:number]}"
  matched_cards = do_you_have_any( holder, guess_card[:number] ) 

  held_matches = do_you_have_any( guesser, guess_card[:number] ) 

  if matched_cards.any? || held_matches.any?
    puts "Yes... #{matched_cards.length}"
    puts "and I have... #{held_matches.length}"

    matched_cards.each { |matched_card| holder.delete( matched_card ) }
    held_matches.each { |matched_card| guesser.delete( matched_card ) }
  else
    puts "No...Go Fish"
    new_card = deck.pop
    guesser.push( new_card )
    guesser.push( guess_card )
    puts "Added a new #{new_card[:number]}, and the #{guess_card[:number]} back to your hand"
  end
end