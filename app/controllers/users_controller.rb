class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    params.permit!
    @user = User.new(params[:user])
    if  @user.save
      # Handle a successful save
      flash[:success] = t"flash.message"
      redirect_to @user

    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :address, :phone,  :email, :password, :remember_digest)
  end
end
