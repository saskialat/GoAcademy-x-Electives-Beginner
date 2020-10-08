# SASKIA LATIEVARYA
# GoFood Matchmaking System RE-DO
# Sunday, September 6, 2020
# - write all classes and all methods needed
# - stopped at sort_drink
# Friday, September 11, 2020
# - finish methods in sort_drink
# Saturday, September 12, 2020 
# - debug 
# - findings: error in sort_flavor, sort_budget

class Menu

    attr_accessor :entries

    # def initalize
    #     @entries = []
    #     @no_of_entries = 0
    # end

    def initialize(no_of_entries)
        @entries = []
        @no_of_entries = no_of_entries
    end

    def create_food_or_drink(tags)
        case tags[0]
        when "add_food"
            entry = Food.new(tags)
        when "add_drink"
            entry = Drink.new(tags)
        end
        @entries << entry
    end

    def create_menu
        number = @no_of_entries # number variable to avoid changing no_of_entries value
        print "created #{number} menu\n"
        while number != 0
            print "> "
            type, input_one, input_two, input_three, input_four, input_five, input_six, input_seven = gets.split.map(&:to_s)
            tags = [type, input_one, input_two, input_three, input_four, input_five, input_six, input_seven]
            create_food_or_drink(tags)
            number = number - 1
        end
    end

    def list_menu
        @entries.each do |entry|
            entry.print_out
        end
    end

end

class Entry

    attr_accessor :name, :price
    
    def initialize(tags)
        @name = tags[1].downcase
        @price = tags[2].to_i

        # print "#{@name} added \n"
    end

    def print_out
        print "#{@name} Rp#{@price.to_s} "
    end
end

class Food < Entry

    attr_accessor :is_vegan, :flavor, :is_healthy, :origin

    def initialize(tags)
        super
        @is_vegan = set_vegan?(tags[3].downcase)
        @flavor = [tags[4].downcase, tags[5].downcase] # array for the purpose of recommendation
        @is_healthy = set_healthy?(tags[6].downcase)
        @origin = tags[7].downcase
        print "#{@name} added \n" # how can i super the variables, but not the print?
    end
    
    def set_vegan?(is_vegan)
        if is_vegan == "vegan"
            true
        else
            false
        end
    end

    def set_healthy?(is_healthy)
        case is_healthy
        when "healthy"
            true
        when "junk_food"
            false
        end
    end

    def print_out
        super
        case is_vegan
        when true # made me realize turning the vegan/ non-vegan into a boolean might not be practical for this, not needed, can simply test for whether the string is equal or not
            print "vegan "
        when false
            print "non-vegan "
        end
        print "tags: #{flavor[0].to_s}, #{flavor[1].to_s}, " # is to_s needed? The elements of the flavor array are strings so to_s is irrelevant?
        case is_healthy
        when true
            print "healthy, " # we are putting commas on its own, is better to make a local variable for the strings to print and then concatenate?
        when false
            print "junk_food, " # is it bad that the whole program (Food class and Waiter/Recommendation) has a mutual agreement that when it is not true that the object is vegan, it is junk_food, without keeping "junk_food" in a string variable?
        end 
        print "#{@origin} \n"
    end

end

class Drink < Entry

    # attr_accessor :name, price

    attr_accessor :size, :temperature, :contains_caffeine, :flavor, :origin

    def initialize(tags)
        super
        @size = tags[3].upcase
        @temperature = tags[4]
        @contains_caffeine = set_caffeine?(tags[5])
        @flavor = [tags[6]] # array for the purpose of recommendation
        @origin = tags[7]
        print "#{@name} added \n"
    end

    def set_caffeine?(contains_caffeine)
        case contains_caffeine
        when "non-caffeine"
            false
        when "caffeine"
            true
        end
    end

    def print_out
        super
        print "size: #{@size} "
        print "#{temperature} "
        case @contains_caffeine
        when true
            print "caffeinated "
        when false
            print "non-caffeine "
        end
        print "tags: #{@flavor[0].to_s}, #{@origin} \n" # assuming there is only one element in flavor
    end

end

class Waiter

    # def initialize
    #     @menu = []
    #     @recommendation = []
    #     @all_recommendations = []
    # end

    def initialize(menu)
        @menu = menu.entries
        @recommendation = []
        @all_recommendations = []
    end 

    def sort_nutrition
        print "Do you prefer healthy food or junk food (healthy/junk_food)? \n> "
        choice = gets.chomp
        prefer_healthy = false # can we initialize a boolean without giving a value to a booleean?
        if choice == "healthy"
            prefer_healthy = true
        elsif choice == "junk_food"
            prefer_healthy = false
        end
        unless @recommendation == [] # avoid empty array in each do
            @recommendation.each do |food|
                if food.is_healthy != prefer_healthy
                    @recommendation.delete(food)
                end
            end
        end
    end

    def sort_origin
        print "originality (italy, japan, indonesia, china, any)? \n> "
        choice = gets.chomp.downcase
        unless @recommendation == []
            unless choice == "any"
                @recommendation.each do |food|
                    if food.origin != choice
                        @recommendation.delete(food)
                    end
                end
            end
        end
    end

    def food_recommendation
        sort_type(Food)
        sort_flavor
        sort_budget
        sort_nutrition
        sort_origin
    end

    def sort_size
        print "Which size do you want (S/M/L)? \n> "
        choice = gets.chomp.downcase
        unless @recommendation == []
            @recommendation.each do |drink|
                if drink.size.downcase != choice
                    @recommendation.delete(drink)
                end
            end
        end
    end

    def sort_temperature
        print "Which temperature do you want (hot/cold)? \n> "
        choice = gets.chomp.downcase
        unless @recommendation == []
            @recommendation.each do |drink|
                if drink.temperature != choice
                    @recommendation.delete(drink)
                end
            end
        end
    end

    def sort_caffeine
        want_caffeine = false
        print "Do you want caffeine (yes/no)? \n> "
        choice = gets.chomp.downcase
        if choice == "yes"
            want_caffeine = true
        end
        unless @recommendation == []
            @recommendation.each do |drink|
                if drink.contains_caffeine != want_caffeine
                    @recommendation.delete(drink)
                end
            end
        end
    end

    def drink_recommendation
        sort_type(Drink)
        sort_flavor
        sort_budget
        sort_size
        sort_temperature
        sort_caffeine
        sort_origin
    end

    # simplify, a tad bit long, maybe -> helper method(?)
    def sort_flavor
        equal = 0
        print "What flavor do you prefer? \n> "
        choice = gets.chomp.downcase
        unless @recommendation == [] # to avoid an empty array going through an each do loop
            # print "inital equal is #{equal.to_s} \n"
            @recommendation.each do |entry|
                # print entry.name
                entry.flavor.each do |flavor|
                    if flavor == choice
                        equal = equal + 1
                        # print "equal added if equal #{equal.to_s} \n"
                    end
                end
                # print "final equal after testing is #{equal.to_s} \n"
                if equal == 0
                    # print "final equal is #{equal.to_s}, so delete from recommendations\n"
                    @recommendation.delete(entry)
                end
                equal = 0 # forget this part
                # print "equal value is now back to #{equal.to_s}"
            end
        end
    end

    def sort_budget
        print "How many budgets do you have per person (range DO NOT USE hyphen(-) use a whitespace to seperate min and max)? \n> " # How to separate inputs with hyphen instead of whitespace?
        min, max = gets.split.map(&:to_s)
        min = min.to_i
        max = max.to_i 
        unless @recommendation == [] # to avoid empty array in an each do loop
            @recommendation.each do |entry| # isn't it weird that someone has a minimum preference when picking food? Or does a certain high price range give value to the food, such as hypebeast clothes?
                if entry.price < min || entry.price > max
                    @recommendation.delete(entry)
                end
            end
        end
    end

    def sort_type(type)
        @menu.each do |entry| # @menu error, i fixed it but idk what i fixed:)
            if entry.is_a?(type)
                @recommendation << entry
            end
        end
    end

    # def add_to_all_recommendation
    #     unless @recommendation == []
    #         @recommendation.each do |entry|
    #             @all_recommendations << entry
    #         end
    #     end
    # end

    def print_recommendation
        if @recommendation != []
            print "Recommendations for you: \n "
            @recommendation.each do |entry|
                print "-#{entry.name} "
            end
        else
            print "No recommendation suits your taste:( "
        end
        print "\n"
        # if @all_recommendations != []
        #     print "Recommendations for you: \n "
        #     @all_recommendations.each do |entry|
        #         print "-#{entry.name} \n "
        #     end
            
        # else
        #     print "No recommendation suits your taste:( \n "
        # end
    end

    def give_recommendations
        # @recommendation = @menu
        print "Do you want to drink/eat? \n> "
        choice = gets.chomp.downcase
        case choice
        when "drink"
            drink_recommendation
        when "eat"
            food_recommendation
        end
        # add_to_all_recommendation
        print_recommendation
        @recommendation = []
    end

end

class Main 

    def initalize
        @menu = Menu.new(0) # write to initalize methods, one for the method with a parameter, one without
        @command = ""
        @waiter = Waiter.new(menu)
    end

    def welcome
        print "\n(✿◠‿◠) WELCOME TO GoFood Matchmaking APP (✿◠‿◠) \n"
    end

    def start
        welcome
        # change to do while
        while @command != "exit"
            print "\nWHAT DO YOU WANT TO DO?\n✿ create_menu \n✿ list_menu \n✿ give_recommendations \n✿ exit \n> "
            @command = gets.chomp.downcase
            case @command
            when "create_menu"
                print "How many entries? \n> " # Change to allow unlimited inputs
                number = gets.chomp.to_i
                @menu = Menu.new(number) # CORRECT THISSS
                @menu.create_menu
            when "list_menu"
                @menu.list_menu
            when "give_recommendations"
                @waiter = Waiter.new(@menu)
                @waiter.give_recommendations     
                # print recommendation/ allow more than one recommendation
                # waiter.give_recommendations  
            when "exit"
                print "(✿◠‿◠)THANK YOU FOR USING GoFood Matchmaking APP(✿◠‿◠)\n"   
            end
        end
    end

end

print "====Online Food Matchmaking System========================================\n=======by: Saskia Latievarya==============================================\nNOTE TO COACHES\nThere are 2 differences from the question sheet, \n1)instead of writing the number of menus to input together with create_menu, write create_menu on its own and you will be prompted the number of entries to add to the menu afterwards. \n2)For the price range, instead of seperating the min value and max value with a hyphen (e.g. 1000-99000), use a whitespace instead (1000 99000) \nI will try to improve this later on, thank you for your understanding!\n==========================================================================\n"
main = Main.new
main.start

=begin

Questions
- How can we input unlimited amount of inputs?
- Is it bad practice when print_out on the Entry class does not have \n because it is assumed to be inherited by Food or Drink, where the \n is printed out instead? Can we make a parent class for the sole purpose of inheritance, or should a parent class can also work on its own?
- Do all classes have to be compatible with say another program/ no knowledge at all of any other classes? Encapsulation?
- Super for a variable only? already asked, but for some reason, previous code showed an error and was fixed when changed to a complete initalize method super.
- All methods in Ruby will return the last line executed, what if there i a while loop that is used as a condition. It will be the last thing the method does, not executing the last statement within the while loop, will it still return the last line?
- Is it better to name our objects different from the Class name or is it fine/ according to the use?
- Is there a certain order of methods within a class that is conventionally correct?
- Is there a way to group methods together? For instance a the methods blabla and blablaa is only used by the method food_recommendations
- If we set a boolean varaible as false in default and we ask a user input for yes/no is it better to assign true and false for both cases or is it okay to just assign true if the user inputs yes?
- Can we write to initalize methods, I think we can do this in java if we want to allow different parameters, can we do this in ruby?

What can be improved
- The Food and Drink class does not detect whether a property is a tag or isn't a tag. Which class knows which one is a tag? The class should be printing "tags:"
- flavor[0]
- hyphen instead of whitespace
- Make a helper method for sorts to do "each do" loops

Reoccuring Mistakes
- miss "end" 
- forget print before writing the string to print
- forget to use equals to (==) instead of assign to (=)
- forget to reset variables if used more than once
- did not keep variables consistent (s/m/l downcase or upcase all)

Resources
- Multiple inputs in one line: https://stackoverflow.com/questions/24567684/how-can-i-take-multiple-inputs-from-the-same-line
- 

Lessons
- Actually understand the question, and DO NOT ASSUME, better ask about the question than to assume
- What Ka Mufti meant by unclear parameters: food recommendation, does it have to agree to both flavors or can it just agreee to either one?
=end