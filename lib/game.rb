class Game
    attr_accessor :human_player, :ennemies

    def initialize(human_name)
        @player1 = Player.new("José")
        @player2 = Player.new("Fynn")
        @player3 = Player.new("Jean")
        @player4 = Player.new("Bonnot")
        @ennemies = [@player1, @player2, @player3, @player4]
        @human_player = HumanPlayer.new(human_name)
    end

    def kill_player(player)
        @ennemies.delete(player)
        return @ennemies
    end

    def is_still_ongoing?
        return @human_player.life_points > 0 && !@ennemies.empty?
    end

    def show_players
        puts "Le joueur #{@human_player.name} a #{@human_player.life_points} points de vie"
        puts "Il reste #{@ennemies.length} ennemis"
    end

    def menu
        puts "\n\n"
        puts"Quelle action veux-tu effectuer ?"
        puts "\n\n"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner "
        puts "\n\n"
        puts "attaquer un joueur en vue :"
        @ennemies.each {|i| puts "#{@ennemies.index(i)} - #{i.name} a #{i.life_points} points de vie"}
        puts "\n\n"
        print "> "
    end

    def menu_choice(choice)
        case choice
        when "a"
            @human_player.search_weapon
        when "s"
            @human_player.search_health_pack
        when "0"
            if @ennemies[1] != nil
                @human_player.attaks(@ennemies[0])
                kill_player(@ennemies[0]) if @ennemies[0].life_points < 1
            else
                puts "Relis bien, concentre toi"
            end
        when "1"
            if @ennemies[1] != nil
                @human_player.attaks(@ennemies[1])
                kill_player(@ennemies[1]) if @ennemies[1].life_points < 1
            else
                puts "Relis bien, concentre toi"
            end
        when "2"
            if @ennemies[2] != nil
                @human_player.attaks(@ennemies[2]) 
                kill_player(@ennemies[2]) if @ennemies[2].life_points < 1
            else
                puts "Relis bien, concentre toi"
            end
        when "3"
            if @ennemies[3] != nil
                @human_player.attaks(@ennemies[3])
                kill_player(@ennemies[3]) if @ennemies[3].life_points < 1
            else
                puts "Relis bien, concentre toi"
            end
        else
            puts "Relis bien, concentre toi"
        end
    end

    def ennemies_attack
        @ennemies.each {|i| i.attaks(@human_player)}
    end

    def end
        if @human_player.life_points > 0
            puts "BRAVO ! TU AS GAGNE !"
        else
            puts "Loser ! Tu as perdu !"
        end
    end
end