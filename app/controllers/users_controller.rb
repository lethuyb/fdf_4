class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if  @user.save
      # Handle a successful save
      flash[:success] = "Welcome to the Foods and Drink Store!"
      redirect_to @user

    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :remember_digestS)
  end
end
