class RankingsController < ApplicationController
  def users
    @users = User.all().sort_by(&:reputation)
    @users = @users[0..50].reverse!
  end

  def posts
    @posts = Post.all().sort_by do |post|
      [post.get_likes.size - post.get_dislikes.size, 0].min()
    end
    @posts = @posts[0..50].reverse!
  end

  def categories
  end
end
