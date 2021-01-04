require "./game"
require "./player"

player1 = Player.new
player2 = Player.new
game = Game.new

while !game.is_game_over
  game.reset
  numbers = [rand(20), rand(20)]
  game.question(numbers)
  answer = gets.chomp
  
  if game.check_answer(answer, numbers) == false
    player1.lives = player1.lives - 1
  end

  if player1.lives == 0
    game.game_over("Player 2", player2.lives)
    break
  end

  puts "P1: #{player1.lives}/3 P2: #{player2.lives}/3"
  puts " \n ----- New Turn ----- \n "

  game.toggle_player
  numbers = [rand(20), rand(20)]
  game.question(numbers)
  answer = gets.chomp
  
  if game.check_answer(answer, numbers) == false
    player2.lives = player2.lives - 1
  end

  if player2.lives == 0
    game.game_over("Player 1", player1.lives)
    break
  end

  puts "P1: #{player1.lives}/3 P2: #{player2.lives}/3"
  puts "\n ----- New Turn ----- \n "
end

