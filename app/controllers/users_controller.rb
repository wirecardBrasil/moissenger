class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def new

  end

  def create
    user = User.new(params["user"].symbolize_keys)
    user.save
    @user = User.all
    render "index"
  rescue => e
    Rails.logger.error "-------------> #{e.message}"
    redirect_to action: :index
  end

  def update
    user = User.update(params[:id], params["user"].symbolize_keys)
    user.save
    @user = User.all
    render "index"
  rescue => e
    Rails.logger.error "-------------> #{e.message}"
    redirect_to action: :index
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    @user = User.all
    render "index"
  end
end
