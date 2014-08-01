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
  end

  it 'takes in a word that becomes the guessing word for the game' do
    test_game = Game.new()
    expect(test_game.word('storm')).to eq 'storm'
  end

end
