class PostsController < ApplicationController
  
  before_action :find_post, only: [:edit, :update, :show, :delete]

  def index
  @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
		@post = Post.new(post_params)
      	if @post.save
			flash[:message] = "Post was successfully created."
			redirect_to posts_path
      	else
			render action: 'new'
		end
	end

  private

  def post_params
    if current_user
      params.require(:post).permit!
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end
  
end



