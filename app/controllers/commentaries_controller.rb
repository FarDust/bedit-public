class CommentariesController < ApplicationController
  def index
  end

  def create
    new_comentario = Commentary.create(
      post_id: params['commentary']['post_id'],
      text: params['commentary']['text'],
      user_id: params['commentary']['user_id']
    )
    new_comentario.save()
    redirect_to(post_path(params['commentary']['post_id']))
  end
end
