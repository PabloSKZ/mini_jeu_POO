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
player1 = Player.new("José")
player2 = Player.new("Fynn")
ennemies = [player1, player2]
playerH = HumanPlayer.new("Aziz")

# Combat
while (player1.life_points > 0 || player2.life_points > 0) && playerH.life_points > 0
    puts "\n\n"
    puts playerH.show_state
    puts "\n\n"
    puts"Quelle action veux-tu effectuer ?"
    puts "\n\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts "\n\n"
    puts "attaquer un joueur en vue :"
    puts "0 - #{player1.name} a #{player1.life_points} points de vie"
    puts "1 - #{player2.name} a #{player2.life_points} points de vie"
    puts "\n\n"
    print "> "
    menu_choice = gets.chomp

    case menu_choice
    when "a"
        playerH.search_weapon
    when "s"
        playerH.search_health_pack
    when "0"
        playerH.attaks(player1)
    when "1"
        playerH.attaks(player2)
    else
        puts "Relis bien, concentre toi"
    end
    puts "\n\n"
    puts "Les autres joueurs t'attaquent !" if (player1.life_points > 0 || player2.life_points > 0) && playerH.life_points > 0
    ennemies.each {|i| i.attaks(playerH) if i.life_points > 0}
end

# Fin 
puts "\n\n"
if playerH.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
else
    puts "Loser ! Tu as perdu !"
end