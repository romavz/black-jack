require_relative 'player'
require_relative 'card'

class Dealer < Player
  attr_reader :deck
  attr_reader :state
  
  def initialize (name = "dealer", money = 100)
    super(name, money)
    @cards = []
  end
    
  def new_round(deck)
    super()
    @deck = deck
    @state = :closed
    deck.shuffle
  end
  
  def open_cards
    @state = :opened
  end
   
  def show_cards
    if state == :opened
      return @cards
    end
    
    @cards.map { |card| Card.shirt }
  end

  def show_sum_cards
    if state == :opened
      return sum_cards
    end
    0
  end
  
  def turn
    if sum_cards < 17
      cards << hit_card
    end
  end
  
  def hit_card
    deck.hit
  end
  
  def hit_two_cards
    [hit_card, hit_card]
  end
  
end
