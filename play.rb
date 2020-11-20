require './player.rb'
require './game.rb'
require './board.rb'

puts "Player one, enter your name!"
player1 = gets.chomp
puts "Good, now enter your symbol! Make it a single letter"
symbol1 = gets.chomp.upcase.to_sym
puts "Now player two, enter your name!"
player2 = gets.chomp
puts "And now your symbol. Same as before, a single letter"
symbol2 = gets.chomp.upcase.to_sym

game = Game.new(player1, symbol1, player2, symbol2)
game.play
