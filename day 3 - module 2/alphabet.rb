# SASKIA LATIEVARYA
# Friday, August 15, 2020
=begin

    HOMEWORK
    - move consonants forward 9 places 
    through the alphabet
    - If they pass 'z', start again at 'a'
    - move vowels back 5 places through the alphabet.
    - If they pass 'a', start again at 'z'
    - Provided string:
        - will always be lowercase
        - won't be empty
        - will have no special characters

=end

#   Determines whether letter is a vowel or not
def is_a_vowel( letter )
    if letter.count("aeiou") > 0
        return true
    else
        return false
    end
    
    # vowels = [ 'a', 'e', 'i', 'o', 'u' ]
    # letter_is_vowel = false

    # count = 0
    # while count <  letter.length() 
    #     if vowels[count] == letter
    #         letter_is_vowel = true
    #     end
    #     count += 1
    # end
    
    # if letter_is_vowel == true
    #     return true
    # else
    #     return false
    # end

end

#   Finds the position of a letter in a list of letters
def find_position_of( letter, letters )
    
    count = 0
    while count < letters.length()
        if letter == letters[count]
            position = count
        end
        count += 1
    end

    return position

end

def position_out_of_bound( position, collection )
    
    if position > (collection.length() - 1) || position < 0
        return true
    else
        return false
    end
end

#   Replace a vowel with a letter 5 places behind
#   If the vowel passes 'z', start again at 'a'
#   Replace a consonants with a letter 9 places ahead
#   If the consonant passes 'a', start again at 'z'
def replace_letter( letter )
    alphabets = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    new_letter = ""
    letter_position = find_position_of( letter, alphabets )
    
    case is_a_vowel( letter )
    when true
        new_position = letter_position - 5 
        if position_out_of_bound( new_position, alphabets ) == true
            new_position = new_position + (alphabets.length() - 1) + 1
        end
    when false 
        new_position = letter_position + 9
        if position_out_of_bound( new_position, alphabets ) == true
            new_position = new_position - (alphabets.length() - 1) - 1
        end
    end

    return alphabets[new_position]

end

#   Replace each letters in a word
def replace_word( word )
    new_word = ""
    
    count = 0
    while count < word.length()
        new_word += replace_letter( word[count] )
        count += 1
    end
    return new_word
end

print "Enter a String \n> "
    word = gets.chomp
puts replace_word( word ) 

=begin

QUESTIONS
1. I heard that in python a String is an array of characters, 
but that is not the case for java we have to make an array of the String,
what about Ruby? How does this work for other languages?
2. Do we have to define each variable inside a method, 
is it possible to define a variable public to the document, accessible to the methods?
3. How do we differentiate a public and a private variable/ method 
in languages where we don't define public/private and the variable type?
4. Can we do a method return within if-else? I believe there are limits to this in java.
5. Is there a way to write the replace_letter method once for both the vowels and the consonants (lines 78 to 89)
5. Error in lines 26 to 41

NOTES

ERRORS
- using the wrong method name
- wrong counting for the replacement
- wrong +1 -1 logic in lines 82 and 87
- determining consonants lines 26 to 41

=end
