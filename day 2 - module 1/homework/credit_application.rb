# SASKIA LATIEVARYA
# Saturday, August 8, 2020
# CREDIT APPLICATION

=begin
Create a credit acceptance program, for, condition:
1. have a job
2. income more than 100,000
3. loan less than 10,000
4. expense less than or equal to 70,000 per month
5. software engineer, businessman, government employee 
will get credit 0.7x from their current income
6. married people, income is combined and will 
get max credit 1.5x from combined income
7. married status will be prioritiseed than job status
8. for age range 50-60 will get extra 0.1x
for age range 60-80 will get 0.2x
for age rangee 80-100 0.3x
=end

input = 0
age = 0
has_a_job = false
job_is_priority = false
income = 0
loans = 0
expenses = 0
is_married = false
spouse_income = 0
total_income = 0
eligble = false
base_credit = 0
bonus_credit = 0
total_credit = 0
credit_amt = 0

print "\nWELCOME=TO=OURBANK============================================================ \n\nWe can include you in our credit system, where you can enjoy:\n-short term benefits, such as discounts\n-long term benefits with our point accumulation program\n*terms and conditions apply*\n\nAPPLY TODAY FOR A BETTER TOMORROW\n"

# PERSONAL INFORMATION
puts "\n=======PERSONAL=INFORMATION==================================================="
print "What is your legal name? \n>"
    name = gets.chomp
print "How old are you? \n>"
    age = gets.chomp.to_i
print "Are you married? \n1: YES \n2: NO \n>"
    input = gets.chomp.to_i
    if input == 1
        is_married = true
    end


# CAREER
puts "\n==============CAREEER========================================================="
print "Do you have a Job? \n1: YES \n2: NO \n> "
    input = gets.chomp.to_i
    if input == 1
        has_a_job = true
        print "What is your job? \n1: SOFTWARE ENGINEER, \nENTREPRENEUR, \nGOVERNMENT EMPLOYEE\n 2: OTHER \n>"
            input = gets.chomp.to_i
            if input == 1 
                job_is_priority = true
            end
    end


# FINANCIAL INFORMATION
puts "\n=======FINANCIAL=INFORMATION=================================================="
unless has_a_job == false 
    print "What is your monthly income? \n>"
        income = gets.chomp.to_i
        
    if is_married == true
        print "What is your spouse's monthly income> \n>"
        spouse_income = gets.chomp.to_i
        total_income = income + spouse_income
    else
        total_income = income
    end
        
end
print "Do you have any loans? \n1: YES \n2: NO \n> "
    input = gets.chomp.to_i
    if input == 1
        print "How much? \n>"
        loans = gets.chomp.to_i
    end
print "How much is your monthly expenses? \n>"
    input = gets.chomp.to_i



puts "\n============ELIGIBILITY======================================================="
# ELIGIBILITY
if has_a_job == true && income > 100000 && loans < 10000 && expenses <= 70000
    print "You are elgible for our credit. \n"
    eligble = true
else
    print "You are not eligble for our credit. \n"
end


# CALCULATIONS
if eligble == true
    
    # BASE CREDIT
    if is_married ==true
        base_credit = 1.5
    elsif job_is_priority == true
        base_credit = 0.7
    elsif job_is_priority == false
        base_credit = 0.5
    end

    # BONUS CREDIT
    case age
    when 50..59
        bonus_credit += 0.1
    when 60..79
        bonus_credit += 0.2
    when 80..100
        bonus_credit += 0.3
    end

    total_credit = base_credit + bonus_credit

    # CREDIT AMOUNT

    if is_married == true
        print "Since you are married, we accumulated your spouse's income to our credit program. \n"
    end

    print "You are granted a base credit #{base_credit.to_s}x of the income calculated. "
    if bonus_credit > 0
        print "We also granted you a bonus credit with an additional #{bonus_credit}x."
    end
    credit_amt = total_credit * total_income
    print " \nThe total amount of credit is #{credit_amt.to_i}. \n"
end

