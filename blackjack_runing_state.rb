require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'deck'
require_relative 'blackjack_game_state'

class BlackJackRuningState < BlackJackGameState
  ROUND_IN_PROGRESS_MESSAGE = "Чтоб начать новый раунд, необходимо закончить текущий".freeze

  def new_round
    raise ROUND_IN_PROGRESS_MESSAGE
  end

  def take_card
    user.take_cards([dealer.hit_card])

    dealer.turn unless user.overage?

    open_cards
  end

  def pass
    dealer.turn
    open_cards
  end

  def open_cards
    dealer.open_cards
    winners = define_winner

    @bank.reward_winners(winners)

    change_game_state
  end

  private

  def define_winner
    return [@dealer] if user.overage? || dealer.sum_cards > user.sum_cards && !dealer.overage?
    return [@user] if dealer.overage? || user.sum_cards > dealer.sum_cards

    [@user, @dealer]
  end

  def change_game_state
    if user.money > 0
      game.state = game.round_over_state
      return
    end
    game.state = game.game_over_state
  end
end
