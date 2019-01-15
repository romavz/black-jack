require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'deck'


class BlackJackRoundOverState
  
  ROUND_ENDED_ERROR = "Раунд завершен, для продолжения начните новый раунд"
  
  attr_reader :user
  attr_reader :dealer
  attr_reader :bank
  attr_reader :game
  
  
  def initialize (game)
    @game = game
    @user = game.user
    @dealer = game.dealer
  end
  
  def new_round
    dealer.new_round(Deck.new)
    user.new_round
    
    game.bank += user.bet
    game.bank += dealer.bet

    user.cards.concat( dealer.hit_two_cards )
    dealer.cards.concat( dealer.hit_two_cards )
    
    game.state = game.get_round_runing_state
  end
  
  def take_card
    raise ROUND_ENDED_ERROR
  end
  
  def pass
    raise ROUND_ENDED_ERROR
  end
  
  def open_cards
    raise ROUND_ENDED_ERROR
  end
  
end