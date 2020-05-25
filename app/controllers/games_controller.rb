class GamesController < ApplicationController
  def new
    array = ('A'..'Z').to_a
    number = (4..10).to_a
    number = number.sample.to_i
    @array = array.sample(number).join
  end

  def score
  end
end
