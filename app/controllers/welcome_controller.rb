class WelcomeController < ApplicationController
  def index
  end

  def search
    if params.key?('search')
      view_matches(params['search']['query'])
    else
      redirect_back(fallback_location: root_path())
    end
  end

  private

  def view_matches(query)
    title = Post.arel_table[:title]
    content = Post.arel_table[:content]
    @posts = Post.where(title.matches("%#{query}%"))
                 .or(Post.where(content.matches("%#{query}%")))
  end
end
