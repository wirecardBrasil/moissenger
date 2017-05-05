class TweetsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweet = Tweet.order("created_at DESC").all
  end

  def new
  end

  def create
    @tweet = Tweet.order("created_at ASC").all
    Tweet.new(params["tweet"].symbolize_keys).save
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
