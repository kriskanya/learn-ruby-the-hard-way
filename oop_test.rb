require 'open-uri'

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = []

PHRASES = {
  "class ### < ###\nend" =>
       "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" =>
       "class ### has-a initialize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" =>
       "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" =>
       "Set *** to an instance of class ###.",
  "***.***(@@@)" =>
       "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" =>
       "From *** get the *** attribute and set it to '***'."
}

PHRASE_FIRST = ARGV[0] == "english" # if english is typed in the
# command line, the program will type out English sentences

# opens words.txt and pushes each word into the WORDS array
open(WORD_URL) { |f|
  f.each_line { |word| WORDS.push(word.chomp) }
}

def craft_names(rand_words, snippet, pattern, caps=false)
  # String.scan is used to extract matches of a regular expression
  # from a string and return the matches in an array
  names = snippet.scan(pattern).map do
    word = rand_words.pop()
    caps ? word.capitalize : word
  end

  # returns the result twice, so you can set the same values
  # for 'question' and 'answer'
  return names * 2
end

def craft_params(rand_words, snippet, pattern)
  # 0...5 creates a range from 0 to 4
  # however many times you find the pattern (/###/) in the snippet,
  # that's how many times this should run
    names = (0...snippet.scan(pattern).length).map do
    # creates random number of words (up to four) for params
      param_count = rand(3) + 1
      params = (0...param_count).map { |x| rand_words.pop() }
      params.join(', ')
    end

  return names * 2
end

def convert(snippet, phrase)
  # sorts the WORDS array randomly
  rand_words = WORDS.sort_by {rand}
  # these are substituted for ###, ***, and @@@ found in PHRASES
  class_names = craft_names(rand_words, snippet, /###/, caps=true)
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = []

  [snippet, phrase].each do |sentence|
    # changes ###, ***, and @@@ to random names, which come
    # from the functions above

    # fake class names, also copies sentence
    result = sentence.gsub(/###/) { |x| class_names.pop }

    # fake other names
    result.gsub!(/\*\*\*/) { |x| other_names.pop }

    # fake parameter lists
    result.gsub!(/@@@/) { |x| param_names.pop }

    # after the ###, ***, and @@@ have been replaced, the
    # finished snippet and phrase is pushed into
    # the 'results' array
    results.push(result)
  end

  return results
end

# keep going until they hit CTRL-D
loop do
  # grabs each key from PHRASES at the top, sorts them randomly
  # snippets are the keys of the PHRASES array
  # phrases are the values of the PHRASES array
  snippets = PHRASES.keys().sort_by {rand}

  for snippet in snippets
    # searches for a hash in PHRASES with key snippet
    phrase = PHRASES[snippet]
    # converts snippet to a full question
    question, answer = convert(snippet, phrase)

    if PHRASE_FIRST
      question, answer = answer, question
    end

    # prints question followed by two line breaks and >
    print question, "\n\n> "

    exit(0) unless $stdin.gets

    # prints answer; this will only print if the user inputs
    # 'english'
    puts "\nANSWER: %s\n\n" % answer
  end
end
