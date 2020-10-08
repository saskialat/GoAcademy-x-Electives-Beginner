class Food
    def initialize(name)
        @name = name
    end
end

class Drink
    def initialize(name, date)
        @name = name
        @date = date
    end
end



def sort_type(type, menu)
    recommendation = []
    print "sort_type \n"
    menu.each do |entry|
        print "hi \n"
        if entry.is_a?(type)
            recommendation << entry
        end
    end

    print recommendation
end

food = Food.new("Saskia")
drink = Drink.new("Not Saskia", "not september")
menu = [food, drink]
sort_type(Drink, menu)
