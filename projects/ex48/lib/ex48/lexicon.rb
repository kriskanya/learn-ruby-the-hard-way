class Lexicon

# %w is a whitespace separated array
  @@words = %w[north south east west down up left right back]
  @@verbs = %w[go stop kill eat]
  @@stop_words = %w[the in of from at it]
  @@nouns = %w[door bear princess cabinet]
  @@number_pattern = /[0-9]+/

  def self.scan(input)

    sentence = []

    user_input = input.split

    user_input.each do |w|
      word = w.downcase
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
      elsif @@number_pattern.match(word)
        sentence.push(["number", word.to_i])
      else
        sentence.push(["error", w])
      end
    end
    return sentence
  end

end
