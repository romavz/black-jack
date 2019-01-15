require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'blackjack_game.rb'

class GameFactory
  
  def create_user(user_name)
    @user ||= Player.new(user_name)
  end
  
  def create_dealer
    @dealer ||= Dealer.new
  end
  
  def create_game (user, dealer)
    @game ||= BlackJackGame.new(user, dealer)
  end
  
end