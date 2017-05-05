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
    puts "============== #{params["tweet"].inspect}"
    tweet = Tweet.new(tweet: params["tweet"]["tweet"])
    tweet.save
    render "index"
  rescue => e
    puts "-------------> #{e.message}"
  end
end
