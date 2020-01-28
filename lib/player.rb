class Player
    attr_accessor :name, :life_points

    def initialize(name, life_points = 10)
        @name = name
        @life_points = life_points
    end

    def show_state
        return self.name + " a " + self.life_points.to_s + " points de vie"
    end

    def gets_damage(damage)
        self.life_points = self.life_points - damage
        if self.life_points > 0
            return self.show_state
        else
            self.life_points = 0
            return puts "Le joueur " + self.name + " a été tué !"
        end
    end

    def attaks(player)
        puts "Le joueur " + self.name + " attaque le joueur " + player.name
        damage = compute_damage
        puts "Il lui inflige " + damage.to_s + " points de dommages"
        player.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name, life_points = 100, weapon_level = 1)
        @name = name
        @life_points = life_points
        @weapon_level = weapon_level
    end

    def show_state
        return self.name + " a " + self.life_points.to_s + " points de vie et une arme niveau " + self.weapon_level.to_s
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        dice = rand(1..6)
        puts "Tu as trouvé une arme niveau " + dice.to_s
        if dice > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = dice
        else 
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end

        return self.show_state
    end

    def search_health_pack 
        dice = rand(1..6)
        if dice == 1
           puts "Tu n'as rien trouvé... "
        elsif dice > 1 && dice < 6 
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points = @life_points + 50
            @life_points = 100 if @life_points > 100
        else 
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points = @life_points + 80
            @life_points = 100 if @life_points > 100
        end

        return self.show_state
    end

end