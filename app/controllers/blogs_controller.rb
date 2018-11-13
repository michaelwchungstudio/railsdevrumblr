class BlogsController < ApplicationController
  def index
  end

  def new
  end

  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    if blog.save
      redirect_to "/"
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = Comment.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end

end
