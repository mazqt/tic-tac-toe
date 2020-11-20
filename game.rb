class Game
  def initialize(player1, symbol1, player2, symbol2)
    @player1 = Player.new(player1, symbol1)
    @player2 = Player.new(player2, symbol2)
    @current_player = ""
    @board = Board.new()
  end

  def play()

    puts "Now let's play some Tic Tac Toe!"

    while !(@board.win? || @board.tie?)
      if @current_player != @player1
        @current_player = @player1
      else
        @current_player = @player2
      end

      puts "It's #{@current_player.name}'s turn! Place your mark by entering two numbers separated by a space."

      @board.display_board


      coordinate = get_coordinates()

      while !@board.place_mark(@current_player.symbol, coordinate)
        coordinate = get_coordinates()
      end

    end

    @board.display_board

    if @board.win?
      puts "Congratulations #{@current_player.name}! You won!"
    else
      @board = Board.new()
      puts "It's a tie! Maybe you've time for a rematch?"
    end
  end

  private

  def get_coordinates
    valid_coordinates = ["0", "1", "2"]

    coordinate = gets.chomp.split

      while !(valid_coordinates.include?(coordinate[0]) && valid_coordinates.include?(coordinate[1]))
        puts "Oops, you formatted your answer wrong!"
        coordinate = gets.chomp.split
      end

      coordinate[0] = coordinate[0].to_i
      coordinate[1] = coordinate[1].to_i
    return coordinate
  end

end


