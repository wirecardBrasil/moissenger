class TweetsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweet = Tweet.all
  end

  def new

  end

  def create
    tweet = Tweet.new(params["tweet"])
    tweet.save
    render "index"
  rescue => e
    puts "-------------> #{e.message}"
  end
end
