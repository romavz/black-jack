require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'deck'

class BlackJackRuningState
  attr_reader :user
  attr_reader :dealer
  attr_reader :bank
  attr_reader :game
  
  def initialize (game)
    @game = game
    @user = game.user
    @dealer = game.dealer
    @bank = game.bank
  end

  def new_round
    raise "Чтоб начать новый раунд, необходимо закончить текущий"
  end

  def take_card
    user.cards << dealer.hit_card
    check_overage
    if game.state == self
      dealer.turn
    end
    
    open_cards
  end

  def pass
    dealer.turn
    open_cards 
  end
  
  def open_cards
    dealer.open_cards
    if dealer.sum_cards > 21
      user_win
      change_game_state
      return
    end
    
    if user.sum_cards == dealer.sum_cards
      user.add_money( game.bank / 2 )
      dealer.add_money( game.bank / 2 )
      change_game_state
      return
    end
    
    if user.sum_cards > dealer.sum_cards
      user_win
    else
      dealer_win
    end
    
    change_game_state
  end

  private
  
  def check_overage
    if user.sum_cards > 21
      dealer_win
      change_game_state
    end
  end
  
  def dealer_win
    dealer.add_money(game.bank)
    game.bank = 0
  end
  
  def user_win
    user.add_money(game.bank)
    game.bank = 0
  end
  
  def change_game_state
    if user.money > 0
      game.state = game.get_round_over_state
      return
    end
    game.state = game.get_game_over_state
    
  end

end
