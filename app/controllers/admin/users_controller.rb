class Admin::UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc).paginate page: params[:page],
      per_page: Settings.per_page
  end
end
