# SASKIA LATIEVARYA
# Friday, August 14, 2020
# WHAT IS YOUR CHANCES TO TRANSFER?

=begin
Program with If and Elsif only
=end
input = 0
name = ""
major_is_competitive = false

req_units_completed = false
major_req_completed = false
GPA = 0.1
igetc_completed = false
honors_certified = false
honors_classes = 0

ec_activities = 0
all_ecs = 0
dedicated_ecs = 0
working_hours = 0 

essay_is_immaculate = false
essay_minutes = 0
essay_reviewers = 0
chance = 0 # out of 100

print " \nWHAT AREE YOUR CHANCES TO TRANSFER TO: \nUC Berkeley\nUC Los Angeles\nUC San Diego\nUC Santa Barbara\nUC Irvine\nUC Davis\nUC Santa Cruz\nUC Riverside\nUC Merced\n"

# PERSONAL INFORMATION
print "Hi what's your name? \n> "
    name = gets.chomp

print "Oh #{name}... cool:) \nWhat major are you going for? Speaking in general ofc heheh \n(1): Computer Science, Economics, Engineering \n(2): Everything else..\n> "
    input = gets.chomp.to_i
    if input == 1
        major_is_competitive = true
    end


# ACADEMICS
print "What's your GPA, out of 4.0?"
    GPA = 
print "How many quarter units did you take champ? "
    quarter_units = gets.chomp.to_i
    if quarter_units => 90
        req_units_completed = true
    end

print "did you complete your IGETC (Important stuff ಥ_ಥ)? \n(1): OFC! \n(2): I had a rough year..\n> "
    input = gets.chomp.to_i
    if input == 1
        igetc_completed = true
    end

print "How about your major requirments? All done? At least before Fall?! \n(1): YESS \n(2): Nope \n> "
    input = gets.chomp.to_i
    if input == 1
        major_req_completed = true
    end

print "How many honors classes did you take, if any? \n> "
    honors_classes = gets.chomp.to_i

print "Are you in the Honors Program though? \n (1):yup \n(2)nay \n> "
    input = gets.chomp.to_i
    if input == 1
        honors_certified = true
    end

# ACTIVITIES
print "How many Extracuriculars did you join"


