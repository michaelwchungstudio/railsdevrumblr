class WelcomeController < ApplicationController
  def index
    @users = User.all
    @blogs = Blog.all
  end
end
