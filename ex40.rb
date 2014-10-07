class Song

  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    @lyrics.each { |line| puts line }
  end

  happy_bday = Song.new(["Happy birthday to you,
        second line,
    third line"])

  bulls_on_parade = Song.new(["They rally around the family,
    with pockets full of shells"])

  happy_bday.sing_me_a_song()

  bulls_on_parade.sing_me_a_song()
end
