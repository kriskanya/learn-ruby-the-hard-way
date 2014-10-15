class Lexicon
  attr_accessor :words, :verbs, :stop_words, :nouns, :number_pattern

# Struct is Ruby method which operates like a hash; see below:

# Customer = Struct.new(:name, :address) do
#   def greeting
#     "Hello #{name}!"
#   end
# end
#
# dave = Customer.new("Dave", "123 Main")
# dave.name     #=> "Dave"
# dave.greeting #=> "Hello Dave!"

# %w is a whitespace separated array

  @@words = %w[north south east west down up left right back]
  @@verbs = %w[go stop kill eat]
  @@stop_words = %w[the in of from at it]
  @@nouns = %w[door bear princess cabinet]
  @@number_pattern = "[0-9]+"

  def self.scan(input)

    sentence = []

    user_input = input.split

    user_input.each do |word|
      word = word.downcase
      # if the words array includes the first inputted word, make it into
      # a hash and then push it into the sentence array
      if @@words.include?(word)
        sentence.push(["direction", word])
      elsif @@verbs.include?(word)
        sentence.push(["verb", word])
      elsif @@stop_words.include?(word)
        sentence.push(["stop", word])
      elsif @@nouns.include?(word)
        sentence.push(["noun", word])
      elsif @@number_pattern.match(input)
        sentence.push(["number", input.to_i])
      else
        sentence.push(["error", word])
      end
    end
    return sentence
  end

end
