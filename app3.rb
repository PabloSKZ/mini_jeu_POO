require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Accueil
puts "-----------------------------------------------------"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !       |"
puts "|  Le but du jeu est d'être le dernier survivant !  |"
puts "-----------------------------------------------------"

# Initialisation des joueurs
puts "\n\n"
puts "C'est quoi ton blaze ?"
print "> "
blaze = gets.chomp
my_game = Game.new(blaze)

# Jeu
while my_game.is_still_ongoing?
    puts "\n\n"
    my_game.show_players
    gets.chomp
    my_game.menu
    choice = gets.chomp
    puts "\n\n"
    my_game.menu_choice(choice)
    gets.chomp
    puts "\n\n"
    puts "Les ennemies attanquent !"
    gets.chomp
    puts "\n\n"
    my_game.ennemies_attack
    gets.chomp
end

#Fin
my_game.end

binding.pry

puts "end of code"