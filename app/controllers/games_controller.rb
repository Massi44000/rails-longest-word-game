require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end
  def score
    @word = params[:word]
    valid = english_word
  end
  def english_word
    url = "https://dictionary.lewagon.com/#{@word}"
    word_dictionary = URI.open(url).read
    word = JSON.parse(word_dictionary)
    return word['found']
  end
end
