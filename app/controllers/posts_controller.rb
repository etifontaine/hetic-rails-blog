class PostsController < ApplicationController
  
  before_action :find_post, only: [:edit, :update, :show, :delete]

  def index
   # @posts = Post.all.reverse
   @posts = Post.order('created_at DESC').paginate(:page => params[:page], per_page: 6)
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
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    flash[:info] = "Post deleted" 
    
    redirect_to root_url
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



