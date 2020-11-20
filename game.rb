require './player.rb'
require './board.rb'

class Game
  def initialize(player1, symbol1, player2, symbol2)
    @player1 = Player.new(player1, symbol1)
    @player2 = Player.new(player2, symbol2)
    @current_player = ""
    @board = Board.new()
  end

  def play()
    puts "Let's play Tic Tac Toe!"

    while !(@board.win? || @board.tie?)
      if @current_player != @player1
        @current_player = @player1
      else
        @current_player = @player2
      end

      puts "It's #{@current_player.name}'s turn! Place your mark by entering two numbers separated by a space."

      @board.display_board


      coordinate = gets.chomp.split
      coordinate[0] = coordinate[0].to_i
      coordinate[1] = coordinate[1].to_i

      while !(@board.place_mark(@current_player.symbol, coordinate))
        coordinate = gets.chomp.split
        coordinate[0] = coordinate[0].to_i
        coordinate[1] = coordinate[1].to_i
      end

      @board.display_board
    end

    if @board.win?
      puts "Congratulations #{@current_player.name}! You won!"
    else
      puts "It's a tie! Maybe you've time for a rematch?"
    end

  end
end
