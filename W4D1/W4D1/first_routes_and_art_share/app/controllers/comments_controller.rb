class CommentsController < ApplicationController
  
  def index 
    if params.has_key?(:user_id)
      render json: User.find_by(id: params[:user_id]).comments
    elsif params.has_key?(:artwork_id)
      render json: Artwork.find_by(id: params[:artwork_id]).comments
    end
  end
  
  def create
    comment = Comment.new(comment_params)
    comment.artwork_id = params[:artwork_id]
    if comment.save 
      render json: comment 
    else 
      render json: comment.errors.full_messages, status: 422
    end
  end
  
  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    render json: comment
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
