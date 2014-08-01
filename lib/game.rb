class Game
  attr_reader :word, :correct_word, :starting_penalty, :max_penalty, :blanks

  def initialize
    @word = ""
    @correct_word = []
    @starting_penalty = 0
    @max_penalty = 6
    @blanks = []
  end

  def set_word(word)
    @word = word
    @correct_word = @word.split("")
    @correct_word.each do
      @blanks << "_"
    end
  end

  def letter_matcher
    valid = nil
    @correct_word.each do |character|
      if character == @letter
        valid = true
      end
    end
    valid
  end

  def guess_input(letter)
    @letter = letter
  end
end
