# SASKIA LATIEVARYA
# Saturday, August 29, 2020
# Slay Demon

=begin
An Evil Demon wants to ruin ABC Kingdom
The King of ABC seent a knight to defeat the demon, Jon
When Jin meets the demon, they are enganged in a turn based battle
The demon has 100 HP & unable to attack because he is tired
Jon will keep slashing the demon with his sword causing 20 damages every slash until the demon HP becomes 0

MODIFY TO MEET ACTIVE PASSIVE CONVENTION
=end


class Knight
    # accessor -> get and set
    # reader -> get doang
    # writer -> set doang
    attr_reader :name

    def initialize(name, power, act, hp)
        @name = name
        @power = power
        @act = act
        @hp = hp
    end

    def attack(demon)
        print "#{@name} #{@act} the #{demon.name} \n"
        demon.attacked(@power)
        
    end

    def attacked(damage)
        @hp -= damage
    end

    def dead?
        if @hp <= 0
            true
        else
            false
        end
    end

end


class Demon
    
    attr_reader :name

    def initialize(name, hp, power)
        @hp = hp
        @power = power
    end
    
    def attacked(damage)
        @hp -= damage
        print "demon lost #{damage} points \n"
    end
    
    def dead?
        if @hp <= 0
            true
        else
            false
        end
    end

    def attack(enemies) # Change
        choice = enemies.sample
        print "demon attacks #{choice.name} \n"
        choice.attacked(@power) 
    end

end


class Game  

    attr_accessor :demon,:knight

    def start
        print "name \n > "
        name = gets.chomp
        @knight = Knight.new("Jon", 20, "slash", 50)
        @mage = Knight.new("Harry", 15, "cast a spell on", 60)
        @assasin = Knight.new("Ezo", 10, "stabs", 40)
        @demon = Demon.new("the Demon", 100, 50)

    end

    # def remaining_players
    #     players
    # end

    def play
        all_enemies = [@knight, @mage, @assasin]
        alive_enemies = []
        all_enemies.each do |enemy|
            unless  enemy.dead?
                alive_enemies << enemy
            end
        end
        alive_enemies.each do |enemy|
            enemy.attack(@demon)
        end
        @demon.attack(all_enemies) # correct
    end
    
    def game_over?
        @knight.dead? && @mage.dead? && @assasin.dead?    
    end

    def stop?
        @demon.dead? || game_over?
    end

    def result
        if stop? 
            if @demon.dead?
                print "The Team won"
            else
                print "The team lost"
            end
        end
    end

end


game = Game.new
game.start
until game.stop? do
    game.play
end
game.result