class Lexicon

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

    @words = %w[north south east west down up left right back]
    @verbs = %w[go stop kill eat]
    @stop_words = %w[the in of from at it]
    @nouns = %w[door bear princess cabinet]
    @number_pattern = "[0-9]+"

  end

  def self.scan(input)

    sentence = []

    user_input = input.split

    user_input.each do |word|
      word_downcase = word.downcase

      # if the words array includes the first inputted word, make it into
      # a hash and then push it into the sentence array
      if @words.include?(word_downcase)
        sentence.push(Pair.new(:direction, word))
      elsif @verbs.include?(word_downcase)
        sentence.push(Pair.new(:verb, word))
      elsif @stop_words.include?(word_downcase)
        sentence.push(Pair.new(:stop, word))
      elsif @nouns.include?(word_downcase)
        sentence.push(Pair.new(:noun, word))
      elsif word.match(@number_pattern)
        sentence.push(Pair.new(:number, word.to_i))
      else
        sentence.push(Pair.new(:error, word))
      end
    end
  end

end
