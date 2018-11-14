class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to "/blogs/#{@blog.id}"
    else
      redirect_to "/blogs/#{@blog.id}"
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    comment = Comment.find(params[:id])
    comment.update(comments_params)
    if comment.save
      redirect_to "/blogs/#{comment.blog_id}"
    else
      render "/comment/#{comment.id}/edit"
    end
  end

  def show
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :blog_id, :user_id)
  end

end
