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
    user = User.new(params["user"])
    user.save
    render "index"
  rescue => e
    puts "-------------> #{e.message}"
  end
end
