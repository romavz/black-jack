require_relative 'card'

class Player
  NOT_ENOUGH_MONEY = "Недостаточно денег для продолжения игры"
  
  attr_accessor :name
  attr_reader :money
  
  def initialize (name, money = 100)
    @name = name
    @money = money
  end
  
  def new_round
    @cards = []
  end
  
  def cards
    @cards ||= []
  end
  
  def show_cards
    cards
  end
  
  def show_sum_cards
    sum_cards
  end
  
  def sum_cards
    sum = 0
    cards.each do |card|
      sum += card.value
    end
    
    cards.each do |card|
      break if sum + card.extra > 21
      sum += card.extra
    end
    
    sum
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
