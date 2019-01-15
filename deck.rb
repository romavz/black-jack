require_relative 'card.rb'

class Deck

  attr_reader :cards
  def initialize
    @suits = %w[ ♠ ♣ ♥ ♦ ]
    @faces = %w[ A 2 3 4 5 6 7 8 9 10 J Q K ]
    
    fill
    
  end

  def fill
    @cards = []
    @suits.each do |suit|
      value = 0
      extra = 10
      counter = 1
      @faces.each do |face|
        value = counter if counter <= 10
        extra = 0 if counter > 1
        @cards << Card.new(:suit => suit, :face => face, :value => value, :extra => extra)
        counter += 1
      end
    end
    
    nil
  end

  def shuffle
    cards.shuffle!.shuffle!
    nil
  end

  def hit
    cards.slice!(-1)
  end

end
