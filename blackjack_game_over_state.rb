require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'deck'
require_relative 'blackjack_game_state'

class BlackJackGameOverState < BlackJackGameState
  GAME_OVER_MESSAGE = "Игра закончена. Казино закрыто.".freeze

  def new_round
    raise GAME_OVER_MESSAGE
  end

  def take_card
    raise GAME_OVER_MESSAGE
  end

  def pass
    raise GAME_OVER_MESSAGE
  end

  def open_cards
    raise GAME_OVER_MESSAGE
  end
end
