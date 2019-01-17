class Bank
  attr_reader :value

  def initialize
    clear
  end

  def add_bet(bet)
    @value += bet
  end

  def reward_winners(players)
    refund_amount = value / players.count
    players.each do |player|
      player.add_money(refund_amount)
    end
    clear
  end

  def clear
    @value = 0
  end
end
