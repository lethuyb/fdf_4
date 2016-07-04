class SuggestsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create]

  def index
    @suggest = Suggest.new
  end

  def create
    @suggest = current_user.suggest.build suggestion_params
    if @suggest.save
      flash[:success] = t "suggestion.created"
    else
      flash[:danger] = t "suggestion.not_created"
    end
    redirect_to :back
  end

  private
  def suggestion_params
    params.require(:suggest).permit :suggest
  end
end
