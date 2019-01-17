class MainView
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def show_player_stat(player)
    print "player: #{player.name} | быланс: #{player.money}$ | карты: "
    player.cards.each do |card|
      print "#{card.face}#{card.suit} "
    end

    print " | сумма очков: #{player.sum_cards}"
    puts
  end

  def show_menu
    menu.activate
  end

  def read_user_choice
    gets.chomp!
  end
end
