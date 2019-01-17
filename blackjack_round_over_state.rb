require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'deck'
require_relative 'blackjack_game_state'

class BlackJackRoundOverState < BlackJackGameState
  ROUND_ENDED_ERROR = "Раунд завершен, для продолжения начните новый раунд".freeze

  def new_round
    dealer.new_round(Deck.new)
    user.new_round

    bank.add_bet(user.bet)
    bank.add_bet(dealer.bet)

    user.take_cards(dealer.hit_two_cards)
    dealer.take_cards(dealer.hit_two_cards)

    game.state = game.round_runing_state
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
