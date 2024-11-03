class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :phoneNumber)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
  end
end
