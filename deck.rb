def card_to_s(card)
  "[#{card[:number]}][#{card[:suit]}]"
end

def deal_cards!( deck )
  deck.shuffle!
  hands = 2.times.collect do |hand|
    deck.slice!(0,5)
  end 

  return hands.first, hands.last
end

def build_deck
  suits = %w[S C H D]
  numbers = (2..10).to_a + %w[J Q K A]
  deck = []
  suits.each do |suit|
    numbers.each do |number|
      deck << {suit: suit, number: number.to_s}
    end
  end
  deck
end

