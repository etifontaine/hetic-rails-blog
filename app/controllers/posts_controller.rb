class PostsController < ApplicationController
  
  before_action :find_post, only: [:edit, :update, :show, :delete]

  def index
    @posts = Post.all
  end

  def show
    @currentUser = current_user.id
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
    begin
      @post = Post.find(params[:id])
    rescue => exception
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end
  
end



