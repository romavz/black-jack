class BlackJackGameState
  attr_reader :user
  attr_reader :dealer
  attr_reader :bank
  attr_reader :game

  def initialize(game)
    @game = game
    @user = game.user
    @dealer = game.dealer
    @bank = game.bank
  end

  def new_round; end

  def take_card; end

  def pass; end

  def open_cards; end
end
