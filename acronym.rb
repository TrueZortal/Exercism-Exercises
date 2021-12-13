class Acronym
  def self.abbreviate(text)
    a = text.scan(/\b\w/) #what does \b\w even mean?
    #a.map! {|x| x.upcase}
    a.map! {|x| x[0].upcase}
    puts a.join
  end
end

#Acronym.abbreviate("laughing my fucking ass off hahahahah oh my god")
#Acronym.abbreviate('Portable Network Graphics')
Acronym.abbreviate('Something - I made up from thin air')
Acronym.abbreviate('Complementary metal-oxide semiconductor')
# [^0-9A-Za-z]