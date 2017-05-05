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
    Tweet.new(params["tweet"].symbolize_keys).save
    @tweet = Tweet.order("created_at DESC").all
    render "index"
  rescue => e
    puts "-------------> #{e.message}"
  end

  def destroy
    Tweet.find(params[:id]).destroy
    @tweet = Tweet.order("created_at DESC").all
    render "index"
  end
end
