class Admin::UsersController < ApplicationController
  before_action :signed_in_user, :check_admin

  def show
  end

  def index
    @users = User.order(created_at: :desc).paginate page: params[:page],
      per_page: Settings.per_page
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit :name, :email,
      :address, :phone, :password, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
  end
end
