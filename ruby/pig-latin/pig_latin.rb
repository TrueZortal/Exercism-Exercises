class PigLatin
    @@vowel_sounds = ['a', 'e', 'i', 'o', 'u', 'xr', 'yt']
    @@consonant_sounds = ['p', 'f', 'k','y', 'x', 'q', 'm', 'r', 'h', 's', 'ch', 'qu', 'th', 'thr', 'sch']
    class << self
        def translate(input)
            @input = input.split(' ')
            actually_translate(@input)
        end
        
        private

        def actually_translate(array)
            answer = String.new
            array.each do |elem|
                p "#{elem} has a y ? #{has_a_y_after_a_block_of_consonants(elem)}"
                if starts_with_vowel_sound?(elem)
                    has_more_than_1_elem(array) ? answer += "#{modify_for_vowel_start(elem)} " : answer += modify_for_vowel_start(elem)
                elsif starts_with_consonant_sound?(elem)
                    has_more_than_1_elem(array) ? answer += "#{modify_for_consonants(elem)} " : answer += modify_for_consonants(elem)
                end
            end
            has_more_than_1_elem(array) ? answer.chomp!(' ') : answer
        end

        def has_more_than_1_elem(array)
            array.size > 1
        end

        def starts_with_vowel_sound?(string)
            @@vowel_sounds.include?(string[0]) || @@vowel_sounds.include?(string[0..1])
        end

        def starts_with_consonant_sound?(string)
            @@consonant_sounds.include?(string[0]) || @@consonant_sounds.include?(string[0..1]) || @@consonant_sounds.include?(string[0..2])
        end

        def has_a_qu_after_a_consonant_start?(string)
            string[1..2] == 'qu'
        end

        def has_a_y_after_a_block_of_consonants(string)
            return false if string.chars.none? {|x| x == 'y'} 
            string[0..string.chars.find_index('y')]
        end

        def has_a_y_second_in_two_letter_word(string)
            string.size == 2 && string[1] == 'y' 
        end

        def modify_for_a_consonant_start_with_qu(string)
            string = string[3, string.size] + string[0..2] + 'ay'
        end

        def modify_for_vowel_start(string)
            string += 'ay'
        end

        def modify_for_consonant_start(string)
            if @@consonant_sounds.include?(string[0..2])
                string = string[3, string.size] + string[0..2] + 'ay'
                elsif @@consonant_sounds.include?(string[0..1])
                    string = string[2, string.size] + string[0..1] + 'ay'
                else 
                    string = string[1, string.size] + string.chr + 'ay'
                end
        end

        def modify_for_consonants(string)
            # p "this for #{string}"
            if has_a_y_second_in_two_letter_word(string)

            elsif has_a_qu_after_a_consonant_start?(string)
                modify_for_a_consonant_start_with_qu(string)
            else
                modify_for_consonant_start(string)  
            end
        end
    end
end

# PigLatin.translate("chair")
# - **Rule 1**: If a word begins with a vowel sound, add an "ay" sound to the end of the word. 
# Please note that "xr" and "yt" at the beginning of a word make vowel sounds (e.g. "xray" -> "xrayay", "yttria" -> "yttriaay").
# - **Rule 2**: If a word begins with a consonant sound, 
# move it to the end of the word and then add an "ay" sound to the end of the word. 
# Consonant sounds can be made up of multiple consonants, a.k.a. a consonant cluster (e.g. "chair" -> "airchay").
# - **Rule 3**: If a word starts with a consonant sound followed by "qu", 
# move it to the end of the word, and then add an "ay" sound to the end of the word (e.g. "square" -> "aresquay").
# - **Rule 4**: If a word contains a "y" after a consonant cluster or 
# as the second letter in a two letter word it makes a vowel sound (e.g. "rhythm" -> "ythmrhay", "my" -> "ymay").