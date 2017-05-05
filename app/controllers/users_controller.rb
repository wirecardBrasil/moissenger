class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def new

  end

  def create
    @user = User.all
    user = User.new(params["user"].symbolize_keys)
    user.save
    render "index"
  rescue => e
    puts "-------------> #{e.message}"
  end
end
