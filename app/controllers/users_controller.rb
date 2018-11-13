class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def profile
    @user = User.find(params[:id])
    @userblogs = Blog.where(user_id: params[:id])
    @usercomments = Comment.where(user_id: params[:id])
  end

end
