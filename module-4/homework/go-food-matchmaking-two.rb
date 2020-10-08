# SASKIA LATIEVARYA
# Friday, September 4, 2020
# GoFood Matchmaking System
# two: Sunday, September 6, 2020

class Menu

    attr_accessor :list_menu
    def initialize
        @list_menu = []
    end

    def add_menu(entry)
        @list_menu << entry
    end

    # hm
    def food_not_beverage?
        print "Is it a food or a beverage? (1: Food, 2: Beverage) \n> "
        choice = gets.chomp.to_i
        if choice == 1
            true 
        else 
            false
        end
    end

    def create(number_of_entries)
        while number_of_entries > 0 
            print number_of_entries
            # print "Entry number " +  
            if food_not_beverage? 
                entry = Food.new
            else
                entry = Drink.new
            end

            add_menu(entry)
            number_of_entries = number_of_entries - 1
        end
    end 

end

class Entry

    attr_accessor :name, :price, :tags

    def initialize # HEREEEEEE
        @name = set_name
        @price = set_price
        @tags = set_tags
    end

    def set_name
        print "Name? \n> "
            name = gets.chomp
        return name
    end

    def set_price
        print "Price (in Rupiah)? \n> "
            price = gets.chomp.to_i
        return price
    end

    def set_tags
        tags = []
        choice = 1

        while choice != 2
            print "Set a tag = "
                tag = gets.chomp.downcase
            tags << tag
            print "Add another tag? (1: YES, 2: NO) \n> "
                choice = gets.chomp.to_i
        end    

        return tags
    end

end

class Food < Entry
    
    attr_accessor :name, :price, :tags, :is_vegan

    def initialize
        super
        @is_vegan = vegan?
    end

    def vegan? 
        print "Is #{name} vegan? (1: YES, 2: NO) \n> "
        input = gets.chomp.to_i
        if input == 1
            true
        else
            false
        end

    end

end

class Drink < Entry
    
    def initialize
        super
        @size = set_size
        @temperature = set_temperature
        @is_caffeine = caffeine?
    end
    
    def set_size
        print "S/M/L? \n> "
        choice = gets.chomp.downcase
    end

    # GIMANA
    def set_temperature
        print "Do you want your drink hot or cold? (hot/cold) \n>"
        choice = gets.chomp.downcase
    end

    def caffeine?
        print "Does #{name} contain caffeine? (1: YES, 2: NO) \n> "
        input = gets.chomp.to_i
        if input == 1
            true
        else
            false
        end
    end

end

class Recommendation

    def initialize(menu)
        @menu = menu
        @tags = []
        @recommended_list = []
    end

    # done
    def sort_vegan
        is_vegan = false
        print "Are you a vegan? (1: YES, 2: NO) \n> "
        choice = gets.chomp.to_i
        if choice == 1
            is_vegan = true
            @recommended_list.each do |food|
                if food.is_vegan != is_vegan
                    @recommended_list.delete(food)
                end
            end
        end

    end

    # done
    def sort_nutrition
        print "Do you prefer healthy/ junk food (healthy/junk_food)? \n> "
        nutrition_choice = gets.chomp.downcase
        @recommended_list.each do |food|
            count = 0
            food.tags.each do |tag|
                if tag == nutrition_choice
                    count = count + 1
                end
            end
            if count == 0
                @recommended_list.delete(food)
            end
        end
    end

    # done
    def sort_food
        @menu.list_menu.each do |entry|
            if entries.is_a?(Food)   
                @recommended_list << entry
            end
        end
        if @recommended_list != []
            sort_vegan  
            if @recommended_list !=[]
                sort_nutrition
            end
        end
    end

    # done
    def sort_size
        print "S/M/L? \n> "
        size_choice = gets.chomp.downcase
        @recommended_list.each do |drink|
            if drink.size != size_choice
                @recommended_list.delete(drink)
            end
        end
    end

    # done
    def sort_caffeine
        is_caffeine = false
        print "Do you want your drink with caffeine? (1:YES, 2:NO) \n> "
        caffeine_choice = gets.chomp.to_i
        if caffeine_choice == 1
            is_caffeine = true
        end
        @recommended_list.each do |drink|
            if drink.is_caffeine != is_caffeine
                @recommended_list.delete(drink)
            end
        end
    end

    # done
    def sort_temperature
        print "Do you prefer Hot or Cold? (hot/cold) \n> "
        temp_choice = gets.chomp.downcase
        @recommended_list.each do |drink|
            if drink.temperature != temp_choice
                @recommended_list.delete(drink)
            end
        end
    end

    # done
    def sort_drink 
        @menu.list_menu.each do |entry|
            if entries.is_a?(Drink)
                @recommended_list << entry
            end
        end
        if @recommended_list!= []
            sort_size
            if @recommended_list != []
                sort_caffeine
                if @recommended_list!= []
                    sort_temperature
                end
            end
        end
    end

    # SIMPLIFY THIS thanks sas: ) ) ) ) )) ) ) )) done;)
    def sort_food_or_drink
        print "Do you want to eat/ drink? (1:EAT, 2:DRINK) \n>"
        choice = gets.chomp.to_i
        if choice == 1
            sort_food
        elsif choice == 2
            sort_drink
        end
    end

    # done
    def sort_flavor
        print "What flavor do you prefer (sweet/ salty/ sour/ bitter/ spicy/ umami/ x: no preference)? \n> "
            flavor_choice = gets.chomp.downcase
        unless flavor_choice == x
            @recommended_list.each do |entry|
                count = 0
                entry.tags.each do |tag|
                    if tag == flavor_choice
                        count = count + 1
                    end
                end
                if count == 0
                    @recommended_list.delete(entry)
                end
            end
        end
    end 

    # done
    def sort_origin
        print "Where do you want it to originate from?"
            origin_choice = gets.chomp.downcase
        @recommended_list.each do |entry|
            count = 0
            entry.tags.each do |tag|
                if tag == origin_choice
                    count = count + 1
                end
            end
            if count == 0
                @recommended_list.delete(entry)
            end
        end
    end
        
    def sort_price_range
        "What is the highest price you are willing to pay for it?"
        price_choice = gets.chomp.to_i
        @recommended_list.each do |entry|
            if entry.price > price_choice
                @recommended_list.delete(entry)
            end
        end
    end

    # done
    def find_entry
        print "RECOMMENDATION"
        sort_food_or_drink
        if @recommended_list != []
            sort_flavor
            if @recommended_list != []
                sort_origin
                if @recommended_list != []
                    sort_price_range
                end
            end
        end
    end
end

class Customer

    def initialize
        @name = set_name
        @menu = nil # ?
    end 
    
    def set_name
        print "What is your name? \n> "
        @name = gets.chomp
    end

    def create_list
        @menu = Menu.new
        print "Create a Menu \nHow many food/beverages do you want to put in the menu? \n>"
            number = gets.chomp.to_i
        @menu.create(number)
    end 

    def get_recommendation
        print "RECOMMENDATION" # Is it better to have this in the Customer class or in the Recommendation class?
        user_rec = Recommendation.new(@menu)
    end

end

class Main 

    # def initialize
    # end

    def new_user
        customer = Customer.new
        customer.create_list
        # customer.get_recommendation
    end

    def existing_user
    end



    # simplify: change to a do while loop
    def start

        print "\nGO FOOD MATCHMAKING APP \n\n1: Make a new Account \n2: Log in to existing account \n3: Exit \n> "
        input = gets.chomp.to_i

        while input != 3
            if input == 1
                new_user
            elsif input == 2
                existing_user
            elsif input == 3
                print "END"
            end 

            if input == 1 || input == 2
                print "Use app again? (1: YES, 2: NO) \n> "
                choice = gets.chomp.to_i
                if choice == 1
                    print "\nGO FOOD MATCHMAKING APP \n\n1: Make a new Account \n2: Log in to existing account \n3: Exit \n> "
                    input = gets.chomp.to_i
                end
            end
        end   
    end 

end 

application = Main.new
application.start




# return entry_list # Can I delete this since it's the last statement used? It isn't the last condition used though
# what if we delete an element of an array when we are testing an array?
# can we inherit a method only, and not a class? no