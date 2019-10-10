word_list = []
File.open('word_list.txt').each do |line|
  word_list << line.delete("\n")
end

letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9','0', ' ']

moorse = ['.-', '-...', '-.-.', '-..', '.', '..-.', '--.', '....', '..', '.---', '-.-', '.-..', '--', '-.', '---', '.--.', '--.-', '.-.', '...', '-', '..-', '...-', '.--', '-..-', '-.--', '--..', '.----', '..---', '...--', '....-', '.....', '-....', '--...', '---..', '----.', '-----',' ']

def moorseMe (word, letters, moorse)
  split_word = word.split('')
  moorse_word = []
  split_word.each do |c|
    i = letters.index(c)
    moorse_word << moorse[i]
  end
  return moorse_word
end

def moorsedWord(word)
  moorsed_word = word.join(" ")
end

def smooshMoorsedWord(word)
  smooshedWord = word.join("")
end

smooshed_word_list = []

word_list.each do |word|
  morsed_word = moorseMe(word, letters, moorse)
  smooshed_word = smooshMoorsedWord(morsed_word)
  smooshed_word_list << smooshed_word
end

def unSmoosh(smooshed_word, word_list, smooshed_word_list)
  possible_words = []
  index = 0
  smooshed_word_list.each do |w|
    if smooshed_word == w
      possible_words << word_list[index]
    end
    index = index + 1
  end
  possible_words.join(", ")
end

def start
  p "Type 'wsm' to convert to a word to smooshed morse code or 'smw' to covert smooshed morse code to possible words"
  print 'Choice: '
  user_choice = gets.chomp
  p "-" * 25
  return user_choice
end

user_choice = start

if user_choice == 'wsm'
  print 'Enter a word to convert to smooshed moorse code: '
  user_input = gets.chomp.downcase
  p "-" * 25
  print 'You entered: '
  p user_input
  
  moorsed_word = moorseMe(user_input, letters, moorse)

  print 'Your word in moorse code: '
  p moorsedWord(moorsed_word)
  
  print 'Your word in smooshed moorse code:'
  smooshed_word = smooshMoorsedWord(moorsed_word)
  p smooshed_word
elsif user_choice == 'smw'
  print 'Enter smooshed morse code to convert to possible words: '
  user_input = gets.chomp.downcase
  p "-" * 25

  print 'You entered: '
  p user_input

  print 'The word unsmooshed can possibly be:'
  p unSmoosh(user_input, word_list, smooshed_word_list)
else
  p "You must enter wsm or smw"
end
