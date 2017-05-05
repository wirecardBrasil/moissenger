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
    @tweet = Tweet.find(:all, order: "created_at ASC")
    Tweet.new(tweet: params["tweet"]["tweet"]).save
    render "index"
  rescue => e
    puts "-------------> #{e.message}"
  end

  def destroy
    @tweet = Tweet.all
    Tweet.find(params[:id]).destroy
    render "index"
  end
end
