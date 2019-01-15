require_relative './menu/menu.rb'
require_relative './menu/menu_item.rb'
require_relative 'game_factory.rb'

class Application
  INVITATION_MESSAGE = "Введите Ваше имя:"
  
  attr_reader :user
  attr_reader :dealer
  attr_reader :game
  
  def initialize(game_factory)
    @factory = game_factory
    @menu = create_menu
  end

  def run
    user_name = take_user_name
    @user = @factory.create_user(user_name)
    @dealer = @factory.create_dealer
    @game = @factory.create_game(user, dealer)
    @menu.activate

    round_play
    nil
  end

  private

  def round_play
    loop do
      item_id = gets.chomp!
      begin
        @menu[item_id].activate
      rescue StandardError => ex
        puts ex.message.to_s
      end
      @menu.activate
    end
  end

  def take_user_name
    puts INVITATION_MESSAGE
    user_name = gets.chomp!
  end

  def create_menu
    menu = Menu.new("") { show_stat }
    menu.add("1", MenuItem.new("Новый раунд") { game.new_round } )
    menu.add("2", MenuItem.new("Взять карту") { game.take_card } )
    menu.add("3", MenuItem.new("Пас") { game.pass } )
    menu.add("4", MenuItem.new("Открыть карты") { game.open_cards } )
    menu.add("0", MenuItem.new("Выход") { exit } )
    menu
  end
  
  def show_stat
    show_player_stat(@user)
    show_player_stat(@dealer)
  end

  def show_player_stat(player)
    print "player: #{player.name} | быланс: #{player.money}$ | карты: "
    player.show_cards.each do |card|
      print "#{card.face}#{card.suit} "
    end
    
    print " | сумма очков: #{player.show_sum_cards}"
    puts
  end

end


factory = GameFactory.new
app = Application.new(factory)
app.run
