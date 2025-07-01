class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment posted successfully."
    else
      flash[:alert] = "Failed to post comment: " + @comment.errors.full_messages.to_sentence
    end

    redirect_back fallback_location: @commentable.is_a?(Post) ? post_path(@commentable) : root_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      flash[:notice] = "Comment deleted successfully."
    else
      flash[:alert] = "You can only delete your own comments."
    end
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    if params[:post_id]
      Post.find(params[:post_id])
    elsif params[:comment_id]
      Comment.find(params[:comment_id])
    else
      nil
    end
  end
end