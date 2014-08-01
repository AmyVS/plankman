require './lib/game'
def main_menu
  game = Game.new
  word_picker
  game.set_word(@selected_word)

    puts "PLANK MAN"
    sleep 1
    puts "\n\n"
    puts "Arrr, matey. This game be called Plank-man and if ye lose, ye walk the plank"
    puts "Schmee... pick a word for this scallywag!"
    puts "\n\n"
    sleep 1
    puts "..."
    sleep 2
    puts "SCHMEE! A WORD PLEASE!"
    sleep 2
    puts "Schmee: 'sorry me captian! ahoy! word ho!"
    sleep 1
    print game.blanks.join
    puts "\n\n"
  loop do
    if game.starting_penalty == game.max_penalty
      puts "WALK THE PLANK!"
      exit
    elsif game.blanks == game.correct_word
      puts "YOU WIN!... soooooo much booty!"
      main_menu
    end
    puts "guess a letter. Personally I am fond of Rrrrrrrr..."
    letter = gets.chomp
    game.guess_input(letter)
    score = game.starting_penalty
    game.letter_matcher
    new_score = game.starting_penalty

    if score == new_score
      puts game.blanks.join
      puts "arrrrr good guess!"
    else
      puts "you got " + new_score.to_s + " wrong!"
      puts "arrr try again!"
    end

    puts "Here's how we are doing so far."
    puts game.blanks.join


  end
end

def word_picker
  words = ["pirate","gold","rum","ship","island","ahoy"]
  number = Random.new
  selected_word = words[number.rand(words.length)]
  @selected_word = selected_word
end


main_menu
