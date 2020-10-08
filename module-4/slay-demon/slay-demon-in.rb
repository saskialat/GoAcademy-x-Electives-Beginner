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

class Player

    attr_reader :name

    def initialize(name, act, power, hp)
        @name = name
        @power = power
        @act = act
        @hp = hp
    end

    def attack(demon)
        print "Knight slashed the #{demon.name} \n"
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


class Hero < Player
    # accessor -> get and set
    # reader -> get doang
    # writer -> set doang

    def attack(demon)
        print "#{@name} #{@act} the #{demon.name} \n"
        demon.attacked(@power)
        
    end

end


class Demon < Player
    
    attr_reader :name

    def attack(enemies) # Change
        choice = enemies.sample
        print "demon #{@act} #{choice.name} \n"
        choice.attacked(@power) 
    end

end

class Weapon

    def initialize(act)
        @act = act
    end

    def utilize(hero)
        print "#{hero.name} #{act} \n"
    end

end


class Game  

    attr_accessor :demon,:knight

    def start
        
        # print "name \n > "
        # name = gets.chomp
        
        @wand = Weapon.new("swing the wand")
        @dagger = Weapon.new("throw the dagger")

        @knight = Hero.new("Jon","slash", 20, 50)
        @mage = Hero.new("Harry", "cast a spell on", 15, 60)
        @assasin = Hero.new("Ezo", "stabs", 10, 40)
        @heroes = [@knight, @mage, @assasin]

        @demon = Demon.new("the Demon", "attacks", 100, 50)
        @villian = [@demon]

    end

    def remaining_heroes #hero encapsulation?
        alive_heroes = []
        @heroes.each do |hero|
            unless  hero.dead?
                alive_heroes << hero
            end
        end
        return alive_heroes
    end

    def play 
        remaining_heroes.each do |enemy| #THIS
            enemy.attack(@demon)
        end
        @demon.attack(remaining_heroes)
    end
    
    def game_over?
        remaining_heroes == nil # Ini?
        # @knight.dead? && @mage.dead? && @assasin.dead?    
    end

    def stop?
        @demon.dead? || game_over?
    end

    def result
        if stop? 
            if @demon.dead?
                print "The Team won \n"
            else
                print "The team lost \n"
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