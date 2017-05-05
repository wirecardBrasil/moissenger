class TweetsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweet = Tweet.all
  end
end
