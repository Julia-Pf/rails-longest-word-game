require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a.sample(10)
    end

  def score
    #score is valid when input is includes in the api https://wagon-dictionary.herokuapp.com/:word
    @input = params[:input]
    @url = "https://wagon-dictionary.herokuapp.com/#{@input}"
    respone = URI.open(@url)
    json_response = JSON.parse(response)
    if json_response["found"] == true
      puts "Congratuliations! #{@input} is a valid englisch word!"
    elsif json_response["error"] == "word not found"
      puts "Sorry #{@input} is not an english word."
    else
      puts "Sorry #{@input} can’t be built out of the original grid "
    end
  end
end
