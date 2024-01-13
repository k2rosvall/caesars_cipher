# frozen_string_literal: true
require "pry-byebug"

ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u
              v w x y z].freeze

def ceasars_cipher(phrase, key)
  encoded_word = []
  phrase.split(' ').each do |word|
    encoded_word << cipher_word(word, key)
  end
  encoded_word.join(' ')
end

def cipher_word(word, key)
  encoded_characters = []
  word.split('').each do |char|
    unless letter?(char)
      encoded_characters << char
      next
    end

    if upcase?(char)
      assigned_index = uppercase_alphabet.index(char) + key
      assigned_index -= 26 if assigned_index > 25
      encoded_characters << uppercase_alphabet[assigned_index]
    else
      assigned_index = ALPHABET.index(char) + key
      assigned_index -= 26 if assigned_index > 25
      encoded_characters << ALPHABET[assigned_index]
    end
  end
  encoded_characters.join("")
end

def letter?(character)
  character.match?(/[[:alpha:]]/)
end

def upcase?(character)
  character == character.upcase
end

def uppercase_alphabet
  ALPHABET.map(&:upcase)
end


result = ceasars_cipher("What a string!", 5)
puts result
