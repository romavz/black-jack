require_relative 'card'
require_relative 'hand'

class Player
  NOT_ENOUGH_MONEY = "Недостаточно денег для продолжения игры".freeze

  attr_accessor :name
  attr_reader :money

  def initialize(name, money = 100)
    @name = name
    @money = money
    @hand = Hand.new
  end

  def new_round
    @hand.clear
  end

  def take_cards(cards)
    cards.each { |card| @hand.add_card(card) }
  end

  def overage?
    @hand.sum_cards > 21
  end

  def cards
    @hand.cards
  end

  def sum_cards
    @hand.sum_cards
  end

  def add_money(value)
    @money += value
  end

  def bet(value = 10)
    raise NOT_ENOUGH_MONEY if money - value < 0

    @money -= value
    value
  end
end
