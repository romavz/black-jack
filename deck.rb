require_relative 'card.rb'

class Deck
  attr_reader :cards
  def initialize
    fill
  end

  def fill
    @cards = []
    Card::SUITS.each do |suit|
      value = 0
      extra = 10
      counter = 1
      Card::FACES.each do |face|
        value = counter if counter <= 10
        extra = 0 if counter > 1
        @cards << Card.new(suit: suit, face: face, value: value, extra: extra)
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
