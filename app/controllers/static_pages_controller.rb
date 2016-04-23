class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def blog
  	@posts = Post.all.paginate(page: params[:page])
  	@post = current_user.posts.build if logged_in?
  end
end
