require_relative './menu/menu.rb'
require_relative './menu/menu_item.rb'
require_relative './views/user_name_input_view.rb'
require_relative './views/main_view.rb'
require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'blackjack_game.rb'

class Application
  attr_reader :user
  attr_reader :dealer
  attr_reader :game

  def initialize
    @menu = create_menu
    @user_name_view = UserNameInputView.new
    @main_view = MainView.new(@menu)
  end

  def run
    @user_name_view.show
    user_name = @user_name_view.user_name
    @user = Player.new(user_name)
    @dealer = Dealer.new
    @game = BlackJackGame.new(user, dealer)
    @main_view.show_menu

    round_play
    nil
  end

  private

  def round_play
    loop do
      item_id = @main_view.read_user_choice
      begin
        @menu[item_id].activate
      rescue StandardError => ex
        puts ex.message.to_s
      end
      @main_view.show_menu
    end
  end

  def create_menu
    menu = Menu.new("") { show_stat }
    menu.add("1", MenuItem.new("Новый раунд") { game.new_round })
    menu.add("2", MenuItem.new("Взять карту") { game.take_card })
    menu.add("3", MenuItem.new("Пас") { game.pass })
    menu.add("4", MenuItem.new("Открыть карты") { game.open_cards })
    menu.add("0", MenuItem.new("Выход") { exit })
    menu
  end

  def show_stat
    @main_view.show_player_stat(@user)
    @main_view.show_player_stat(@dealer)
  end
end

app = Application.new
app.run
