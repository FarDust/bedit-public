class WelcomeController < ApplicationController
  def index
    @cantidadUsuarios = User.count
    @cantidadPosts = Post.count
    @cantidadForos = Category.count
    @cantidadFavoritos = Favourite.select(:user_id).distinct.count
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
    post_matches(query)
    users_matches(query)
    forum_matches(query)
  end

  def post_matches(query)
    title = Post.arel_table[:title]
    content = Post.arel_table[:content]
    @posts = Post.where(title.matches("%#{query}%"))
                 .or(Post.where(content.matches("%#{query}%")))
  end

  def users_matches(query)
    username = User.arel_table[:username]
    @users = User.where(username.matches("%#{query}%"))
  end

  def forum_matches(query)
    name = Category.arel_table[:name]
    topic = Category.arel_table[:topic]
    @forums = Category.where(name.matches("%#{query}%"))
                      .or(User.where(topic.matches("%#{query}%")))
  end
end
