class UsersController < ApplicationController

  before_action :find_user, only: [:edit, :update, :show, :delete]

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

  private

  def find_user
    begin
      @user = User.find(params[:id])
    rescue => exception
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

end
