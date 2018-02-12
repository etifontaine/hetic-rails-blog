class CommentsController < ApplicationController

  before_action :find_comment, only: [:edit, :update, :show, :delete]

  def index
    @comments = Comment.all
  end

  def show
      @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
		@comment = Comment.new(comment_params)
    if @comment.save
			flash[:message] = "Comment was successfully created."
    end
		redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    flash[:info] = "Comment deleted" 
    
		redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    if current_user
      params.require(:comment).permit!
    end
  end

  def find_comment
    begin
      @comment = Comment.find(params[:id])
    rescue => exception
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

end
