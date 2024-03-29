class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to search_history_path(@comment.search_history)
    else
      @search_history = @comment.search_history
      @comments = @search_history.comments
      render "search_histories/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, search_history_id: params[:search_history_id])
  end
end
