class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
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
    @blog = Blog.find(params[:id])
  end

  def editfromblog
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    if blog.save
      redirect_to "/profile/#{blog.user_id}"
    else
      render "/blogs/#{blog.id}/edit"
    end
  end

  def updatefromblog
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    if blog.save
      redirect_to "/blogs/#{blog.id}"
    else
      render "/blogs/#{blog.id}/editfromblog"
    end
  end

  def destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end

end
