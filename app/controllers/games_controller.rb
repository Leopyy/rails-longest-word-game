require 'open-uri'

class GamesController < ApplicationController
  def new
    array = ('A'..'Z').to_a
    number = (4..10).to_a
    number = number.sample.to_i
    @array = array.sample(number)
  end

  def score
    @word = params['word']
    @sample = params['sample']
    if parse(@word) && regexper(@word, @sample)
      @score = "Congratulations! #{@word} is a valid English word!"
    elsif regexper(@word, @sample) == false
      @score = "Sorry but #{@word} can't be built out of #{@sample}"
    else
      @score = "Sorry but #{@word} does not seem to be a valid English word..."
    end
  end

  def parse(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    data = open(url).read
    valid = JSON.parse(data)
    valid['found']
  end

  def regexper(word, array)
    word = word.upcase
    array_regexp = Regexp.new("^[#{array}]{1,#{array.length}}$")
    word.match?(array_regexp)
  end
end
