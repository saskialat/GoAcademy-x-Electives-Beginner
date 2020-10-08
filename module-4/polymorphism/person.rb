# GoAcademy X Electives

class Person
    def eat(fruit)
        fruit.name
    end

    def nutritional_intake(fruit)
        fruit.nutrition 
    end

end

class Apple
    def name
        puts "I'm an apple"
    end

    def nutrition
        puts "Apple nutrition"
    end
end

class Banana
    def name
        puts "I'm a banana"
    end

    def nutrition
        puts "Banana nutrition"
    end
end

person = Person.new

banana = Banana.new
person.eat(banana) # passing banana as an argumeent
person.nutritional_intake(banana) # passing banana as an argument

apple = Apple.new
person.eat(apple) # passing apple as an argument
person.nutritional_intake(apple) # passing apple as an argument

