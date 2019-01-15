require_relative 'blackjack_game_over_state.rb'
require_relative 'blackjack_round_over_state.rb'
require_relative 'blackjack_runing_state.rb'


class BlackJackGame
  attr_reader :user
  attr_reader :dealer
  attr_accessor :bank
  attr_accessor :state
  
  def initialize(user, dealer)
    @user = user
    @dealer = dealer
    @bank = 0
    @state = get_round_over_state
  end
  
  def new_round
    state.new_round
  end
  
  def take_card
    state.take_card
  end
  
  def pass
    state.pass
  end
  
  def open_cards
    state.open_cards
  end
  
  def exit
    exit
  end
  
  def get_round_over_state
    @round_over ||= BlackJackRoundOverState.new(self)
  end
  
  def get_round_runing_state
    @round_runing ||= BlackJackRuningState.new(self)
  end
  
  def get_game_over_state
    @game_over ||= BlackJackGameOgerState.new(self)
  end
  
end
