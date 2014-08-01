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
    test_game = Game.new()
    test_game.set_word('storm')
    expect(test_game.blanks).to eq ["_", "_", "_", "_", "_"]
  end
end
