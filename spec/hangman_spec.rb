require 'rspec'
require 'game'

describe Game do
  it 'initializes the instance of the game' do
    expect(Game.new()).to be_an_instance_of Game
  end

  it 'initializes the default settings of the game. The main word, correct word, the starting penalty, and max penalty' do
    test_game = Game.new()
    expect(test_game.correct_word).to eq []
    expect(test_game.starting_penalty).to eq 0
    expect(test_game.max_penalty).to eq 6
    expect(test_game.blanks).to eq []
  end

  it 'takes in a word that becomes the guessing word for the game' do
    test_game = Game.new()
    test_game.set_word("storm")
    expect(test_game.word).to eq 'storm'
  end

  it 'takes the word and splits it up for use in the correct_word array.' do
    test_game = Game.new()
    test_game.set_word('storm')
    expect(test_game.correct_word).to eq ['s','t','o','r','m']
  end

  it 'shows the player blanks according to how many letters are in the word' do
    test_game = Game.new
    test_game.set_word('storm')
    expect(test_game.blanks).to eq ["_", "_", "_", "_", "_"]
  end

  it 'takes a guessed letter and stores it for testing against the correct word' do
    test_game = Game.new
    expect(test_game.guess_input("s")).to eq "s"
  end

  it 'adds 1 to the starting penalty if the letter guessed is false' do
    test_game = Game.new
    test_game.set_word("storm")
    test_game.guess_input('x')
    test_game.letter_matcher
    expect(test_game.starting_penalty).to eq 1
  end

  it 'reveals a letter in the blanks if guessed correctly' do
    test_game = Game.new
    test_game.set_word("storm")
    test_game.guess_input('t')
    test_game.letter_matcher
    expect(test_game.reveal).to eq ["_", "t", "_", "_", "_"]
  end

  it 'will tell the player if they guessed all the letters correctly' do
    test_game = Game.new
    test_game.set_word("s")
    test_game.guess_input("s")
    test_game.letter_matcher
    expect(test_game.win_game).to eq "You win!"
  end

  it 'will tell a player that they lost if the starting penalty equals the max penalty' do
    test_game = Game.new
    test_game.set_word("s")
    test_game.guess_input("1")
    test_game.letter_matcher
    test_game.guess_input("2")
    test_game.letter_matcher
    test_game.guess_input("3")
    test_game.letter_matcher
    test_game.guess_input("4")
    test_game.letter_matcher
    test_game.guess_input("5")
    test_game.letter_matcher
    test_game.guess_input("6")
    test_game.letter_matcher
    expect(test_game.lose_game).to eq "You lose!"
  end

end
