# SASKIA LATIEVARYA
# Saturday, August 29, 2020
# Polymorphism 
# - When 2 different objects have the same properties (function)
# - They should be treated the same 
# Soccer

class Goal
    # def location(x,y)
    #     @x = x
    #     @y = y
    # end

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def accept(item)
        # @points += 1
        print "The #{item.name} is in the Goal \n"
    end

end

class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def accept(item)
        print "The player is holding the #{item.name} \n"
    end
end

class Football

    attr_reader :name

    def initialize(name)
        @name = name
    end
end

class Tissue

    attr_reader :name

    def initialize(name)
        @name = name
    end
end

class Baby

    attr_reader :name

    def initialize(name)
        @name = name
    end
end

green = Football.new("green ball")
wet_wipes = Tissue.new("wet wipes")
cassandra = Baby.new("Cassandra the Baby")
saskia = Player.new("Saskia")
goal = Goal.new("Goal")

print "\n"
saskia.accept(green)
saskia.accept(wet_wipes)
saskia.accept(cassandra)
print "\n"
goal.accept(green)
goal.accept(wet_wipes)
goal.accept(cassandra)

print "\n 1. #{cassandra.name} is NOT an item, but just as #{wet_wipes.name} and #{green.name}, #{cassandra.name} can be accepted by both #{saskia.name} and #{goal.name}. \n 2. Same way goes to the two that accepts, #{saskia.name} is a human, whereas #{goal.name} is NOT human. \n 3. #{cassandra.name}, #{wet_wipes.name}, #{green.name}, #{saskia.name} are all different, but they all have a name, so in some ways, they can be treated the same: They can all be identified by their names. \n 4. #{saskia.name} and #{cassandra.name} are realistically human, but based on the code, there is nothing to identify them both as humans. Furthermore, #{saskia.name} can accept things, whereas #{cassandra.name} cannot. They do are not related based on inheritance nor polymorphism (except name), so they are not the same."



