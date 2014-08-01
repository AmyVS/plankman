class Game
  attr_reader :word, :correct_word, :max_penalty, :blanks, :starting_penalty

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

  def guess_input(letter)
    @letter = letter
  end

  def letter_matcher
    if !@correct_word.include?(@letter)
      @starting_penalty += 1
    else
      reveal
    end
  end

  def reveal
    @correct_word.each do |character|
      if character == @letter
        @blanks[@correct_word.index(character)] = @letter
      end
    end
    @blanks
  end

  def win_game
    if @blanks == @correct_word
      result = "You win!"
    end
    result
  end

  def lose_game
    @starting_penalty
    if @starting_penalty == @max_penalty
      result  = "You lose!"
    end
    result
  end

end
