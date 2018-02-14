class PagesController < ApplicationController

  def index
    @posts = Post.last(6).reverse
  end
end
