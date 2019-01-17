class UserNameInputView
  INVITATION_MESSAGE = "Введите Ваше имя:".freeze

  attr_reader :user_name

  def show
    puts INVITATION_MESSAGE
    @user_name = gets.chomp
  end
end
