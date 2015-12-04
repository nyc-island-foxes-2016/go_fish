require_relative 'deck'
require_relative 'go_fish'

describe 'Go Fish' do
  let(:deck) {build_deck}

  describe 'deal_cards!'  do 
    let(:player_count) {2}

    it 'should deal cards to each player' do 
      expect( deal_cards!(deck).length ).to eq player_count
    end

    it 'should deal each player 5 cards' do 
      expect( deal_cards!(deck).first.length).to eq 5
      expect( deal_cards!(deck).last.length).to eq 5
    end

    it 'should remove the cards from the deck' do
      expect{ deal_cards!( deck )}.to change{ deck.length }.from(52).to(42)
    end
  end

  describe 'do_you_have_any' do 
    let(:hand) { deck.shuffle!.slice(0,5) }
    let(:dubs) { [{number: "2"}, {number:"2"}, {number:"5" }] }
    let(:valid_card){ hand.first }

    it 'should return the card if found' do 
      expect( do_you_have_any( hand, valid_card[:number] )).to include valid_card
    end

    it 'should return nil if the hand is missing the card' do
      expect(do_you_have_any(hand,'X')).to eq []
    end 

    it 'should return multiple matches if exists' do 
      expect(do_you_have_any(dubs,'2')).to eq [{number: "2"}, {number:"2"}]
    end
  end

  describe  'game_over?' do
    let( :winner  ){ [] }
    let( :loser ){ deck.shuffle!.slice(0,5) }

    it 'should return true when there is a winner'  do 
      expect( game_over?( winner,loser )).to be true
    end

    it 'should return false when there is no winner'  do 
      expect( game_over?( loser, loser )).to be false
    end
  end
end