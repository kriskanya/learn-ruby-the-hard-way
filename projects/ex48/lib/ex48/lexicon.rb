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

  Pair = Struct.new(:token, :word)

  def initialize

    self.words = %w[north south east west down up left right back]
    self.verbs = %w[go stop kill eat]
    self.stop_words = %w[the in of from at it]
    self.nouns = %w[door bear princess cabinet]
    self.number_pattern = "[0-9]+"

  end

  def self.scan(input)

    sentence = []

    lex = Lexicon.new

    user_input = input.split

    user_input.each do |word|
      word_downcase = word.downcase

      # if the words array includes the first inputted word, make it into
      # a hash and then push it into the sentence array
      if lex.words.include?(word_downcase)
        sentence.push(["direction", word])
      elsif lex.verbs.include?(word_downcase)
        sentence.push(Pair.new(:verb, word))
      elsif lex.stop_words.include?(word_downcase)
        sentence.push(Pair.new(:stop, word))
      elsif lex.nouns.include?(word_downcase)
        sentence.push(Pair.new(:noun, word))
      elsif lex.number_pattern.match(@number_pattern)
        sentence.push(Pair.new(:number, word.to_i))
      else
        sentence.push(Pair.new(:error, word))
      end
    end
  end

end
