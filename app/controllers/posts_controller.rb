class PostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post created"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post deleted"
		redirect_to request.referrer || blog_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :content, :bootsy_image_gallery_id)
		end

		def correct_user
			@post = current_user.posts.find_by(id: params[:id])
			redirect_to blog_path if @post.nil?
		end
end
