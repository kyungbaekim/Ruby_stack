class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render 'comments/index'
  end
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:message] = 'Comment was successfully saved!'
    else
      flash[:message] = 'Error occurred while saving your comment!'
    end
    redirect_to '/products/' + params[:comment][:product_id]
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :product_id)
    end
end
