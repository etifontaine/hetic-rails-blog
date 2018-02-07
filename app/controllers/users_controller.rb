class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create

    @user = User.create(params[:user].permit!)

    redirect_to user_path(@user.id) if @user.persisted?

  end

  def update
    
  end

  def edit
    @user = User.find(1)
  end

  def destroy
    @user = User.find(1)
  end

end
