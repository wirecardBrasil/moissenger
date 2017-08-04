class TweetsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweet = Tweet.order("created_at DESC").all
  end

  def new
    @user_id = current_user.id
  end

  def create    
    Tweet.new(params["tweet"].symbolize_keys).save
    @tweet = Tweet.order("created_at DESC").all
    render "index"
  rescue => e
    puts "-------------> #{e.message}"
  end

  def destroy
    if (params[:user_id] == current_user.id)
      Tweet.find(params[:id]).destroy
    end
    @tweet = Tweet.order("created_at DESC").all
    render "index"
  end
end
