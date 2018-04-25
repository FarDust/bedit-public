class WelcomeController < ApplicationController
  def index
    @posts = Post.limit(5)
  end
  def new
    
  end
end
