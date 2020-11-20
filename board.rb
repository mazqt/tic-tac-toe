class Board
  def initialize()
    @board = Array.new(3) {Array.new(3, "_")}
  end

  def place_mark(player, coordinate)
    if @board[coordinate[0]][coordinate[1]] == "_"
      @board[coordinate[0]][coordinate[1]] = player
      return true
    else
      puts "Oops, that coordinate is already taken."
      return false
    end
  end

  def display_board()
    puts "  0  1  2"
    row0 = @board[0].join("  ")
    puts "0 " + row0
    row1 = @board[1].join("  ")
    puts "1 " + row1
    row2 = @board[2].join("  ")
    puts "2 " + row2
  end

  def tie?()
    @board.each do |row|
      return false if row.any?("_")
    end
    return true
  end

  def win?()
    @board.each do |row|
      return true if row.all? { |mark| mark == row[0] && mark != "_" }
    end

    transposed_board = @board.transpose

    transposed_board.each do |column|
      return true if column.all? { |mark| (mark == column[0] && mark != "_") }
    end

    return true if ((@board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]) && @board[0][0] != "_")
    return true if ((@board[2][0] == @board[1][1] && @board[1][1] == @board[0][2]) && @board[2][0] != "_")

    false
  end

end

puts "Hi"
