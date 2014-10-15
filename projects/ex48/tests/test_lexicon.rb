require "ex48/lexicon.rb"
require "minitest/autorun"

class TestLexicon < Minitest::Test

  def test_directions()
    assert_equal(Lexicon.scan("north"), [['direction', 'north']])

    result = Lexicon.scan("north south east")
    assert_equal(result, [['direction', 'north'],
           ['direction', 'south'],
           ['direction', 'east']])
  end

  def test_verbs()
    assert_equal(Lexicon.scan("go"), [['verb', 'go']])
    result = Lexicon.scan("go kill eat")
    assert_equal(result, [['verb', 'go'],
          ['verb', 'kill'],
          ['verb', 'eat']])
  end



end
