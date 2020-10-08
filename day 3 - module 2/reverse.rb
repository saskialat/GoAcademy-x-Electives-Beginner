# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# Reverse a hash

meaning = { 
    :uno => "one", 
    :dos => "two", 
    :tres => "three"
}
reversed = { 
    meaning[:uno].to_sym => meaning.key("one").to_s, 
    meaning[:dos].to_sym => meaning.key("two"), 
    meaning[:tres].to_sym => meaning.key("three") 
}
print reversed