require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Fynn")
playerH = HumanPlayer.new("Aziz")

=begin
while player1.life_points > 0 && player2.life_points > 0
    puts "\n\n"
    puts "Voici l'état de chaque joueur :"
    puts player1.show_state
    puts player2.show_state
    puts "\n\n"
    puts "Passons à la phase d'attaque :"
    player1.attaks(player2)
    player2.attaks(player1) if player1.life_points > 0 && player2.life_points > 0
end
=end
binding.pry

puts "end of code"