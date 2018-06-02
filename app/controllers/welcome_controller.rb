class WelcomeController < ApplicationController
  def index
  end

  def search
    if params.key?('search')
      title = Post.arel_table[:title]
      content = Post.arel_table[:content]
      @posts = Post.where(title.matches("%#{params['search']['query']}%"))
                   .or(Post.where(content.matches("%#{params['search']['query']}%")))
    else
      redirect_back(fallback_location: root_path())
    end
  end
end
