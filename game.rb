require "./player"
require "./question"



class Game
  def initialize
    @status = 1
    @counter = 0
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @current_player = @player1
  end
  
  def start_game
     until @status == 0
      player = get_current_player
      question = Question.new
      puts "#{player.name}: what is the sum of #{question.a} and #{question.b}?"
      answer = gets.chomp
      if answer != question.answer
        player.reduce_lives
        check_game_status
      end
      switch_players
     end
  end
  
  def check_game_status
    if @current_player.lives == 0
      switch_players
      puts "game ended"
      puts "winner is #{@current_player.name}"
      @status = 0
    end
  end


  def switch_players
    @counter += 1
    @current_player = get_current_player
    
  end

  def get_current_player
    if (@counter).remainder(2) == 0
      @player1
    else 
      @player2
    end
  end
  
end

