class Game
  def initialize
    @word = ""
    @correct_word = []
    @starting_penalty = 0
    @max_penalty = 6
  end

  def word(word)
    @word = word
  end

  def correct_word
    @correct_word
  end

  def starting_penalty
    @starting_penalty
  end

  def max_penalty
    @max_penalty
  end
end
