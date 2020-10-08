# SASKIA LATIEVARYA
# Electives x GoAcademy
# Saturday, August 8, 2020
# Control flow


# if statement
age = 20
if age == 20
    puts "we are young!"
end

# else; executed if condition is false
name = "putri"
if name != "putri"
    puts "she is not putri"
else
    puts "she is putri"
end

# elsif; second condition (elif)
pollution_level = 40
if pollution_level <= 50
    puts "good air"
elsif pollution_level <= 100
    puts "moderate air"
end
=begin
good air will execute, eeven though elsif is true,
because of the order
=end
pollution_level = 70
if pollution_level <= 50
    puts "good air"
elsif pollution_level <= 100
    puts "moderate air"
end
=begin
if is false, elsif is true and is executed
=end

#Combination
pollution_level = 200
if pollution_level > 50 && pollution_level <= 100
    puts "moderate air"
elsif pollution_level <= 50
    puts "good air"
elsif pollution_level > 100 && pollution_level <= 150
    puts "unhealthy for sensitive group"
else
    puts "unhealthy"
end

# unless; executes statement if condition is false, "if" reversed
name = "ha"
unless name == "karen"
    puts "Let's be friends #{name}!"
end

# case when
pollution_level = 50
case pollution_level
when 0..50
    puts "good air"
when 50..100
    puts "moderate air"
when 100..150
    puts "unhealthy"
end
=begin
order matters
=end

# ternary; simplified version of if else
    # if-elsee
    name = "putri"
    if name != "putri"
        puts "she is not putri"
    else
        puts "she is putri"
    end
    # ternary
    puts name == "putri" ? "she is putri" : "she is not putri"
=begin
    sta
    condition (name == "putri")
    case true ("she is putri")
    case false ("she is not putri")
=end
    linee = name == "putri" ? "she is putri" : "she is not putri"
    puts linee
    # prints out she is putri

#truthy
if true
    puts "true is truthy, duh!"
else 
    puts "0 is falsey, wtf!"
end
#falsey
if false
    puts "false is truthy, duh!"
else 
    puts "false is falsey, wtf!"
end
#nil falsey
if nil
    puts "nil is truthy, duh!"
else 
    puts "nil is falsey, wtf!"
end
=begin
OUTPUT
true is truthy, duh!
false is falsey, wtf!
nil is falsey, wtf!
=end
