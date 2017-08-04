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
    Rails.logger.error "-------------> #{e.message}"
    redirect_to action: :index
  end

  def destroy
    current_tweet = Tweet.find(params[:id])
    current_tweet.destroy if current_tweet.user_id == current_user.id
    @tweet = Tweet.order("created_at DESC").all
    redirect_to action: :index
  end
end
