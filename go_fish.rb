def do_you_have_any( player_hand, card_number )
  player_hand.select{ |card| card[:number] == card_number.to_s }
end 

def game_over?( player_1, player_2 )
  player_1.empty? || player_2.empty?
end

def check_for_books( player_hand )
  groups = player_hand.group_by{ |card| card[:number] }
  groups.select{|number, cards| cards.length == 4 }
end

def take_card( guesser, holder, card ) 
  guesser.push( holder.delete( card ))
end

def round(deck, guesser, holder )

  guess = guesser.group_by{|card| card[:number]}.keys.shuffle.first

  puts "#{guess}"
  matched_cards = do_you_have_any( holder, guess ) 
  matched_cards.each { |card| take_card( guesser, holder, card )}

  if matched_cards.empty? 
    puts "No Go Fish..."
    guesser.push( deck.pop )
  else
    puts "Yes #{matched_cards.length}"
  end

  books = check_for_books( guesser )

  books.each do |number, cards|
    puts "Discarding all of the #{number}"
    guesser.delete_if{ |card| card[:number] == number }
  end

  books.keys
end