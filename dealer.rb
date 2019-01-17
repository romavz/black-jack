require_relative 'player'
require_relative 'card'

class Dealer < Player
  attr_reader :deck
  attr_reader :state

  def initialize(name = "dealer", money = 100)
    super(name, money)
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

  def cards
    return @hand.cards if state == :opened

    @hand.cards.map { Card.shirt }
  end

  def sum_cards
    return @hand.sum_cards if state == :opened

    0
  end

  def turn
    @hand.add_card(hit_card) if @hand.sum_cards < 17
  end

  def hit_card
    deck.hit
  end

  def hit_two_cards
    [hit_card, hit_card]
  end
end
