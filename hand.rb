require_relative 'card'

class Hand
  def cards
    @cards ||= []
  end

  def clear
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def sum_cards
    sum = 0
    cards.each { |card| sum += card.value }

    cards.each do |card|
      break if sum + card.extra > 21

      sum += card.extra
    end

    sum
  end
end
