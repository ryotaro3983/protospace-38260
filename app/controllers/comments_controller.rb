class CommentsController < ApplicationController

  def create
    @comment = Comment.new(create_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      render "prototypes/show"
    end
  end

  private
  def create_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
