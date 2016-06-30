class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      flash[:sucess] = t "comments.comment"
    else
      flash[:danger] = t "comments.error"
    end
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit :comment, :user_id, :product_id
  end
end
