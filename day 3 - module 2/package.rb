# SASKIA LATIEVARYA
# Saturday, August 15, 2020
=begin
 Which delivery service package should the user choose 
in the case where certain days are needed
=end

package = ""

print ("When should your package be delivered? (in days) \n> ")
    days = gets.chomp.to_i
case days
when 1..1 
    package = "One day service"
when 2..4 
    package = "Regular service"
when 5..7
    package = "Economic service"
when 8..10
    package = "Cargo service"
end

print "Use #{package} \n"