class CommentariesController < ApplicationController
  before_action(:authenticate_user!, except: [:show])
  def index
  end

  def create
    if params.key?('commentary')
      new_comentario = Commentary.create(
        post_id: params['commentary']['post_id'],
        text: params['commentary']['text'],
        user_id: params['commentary']['user_id']
      )
      new_comentario.post << Post.find(params['commentary']['post_id'].to_i)
      new_comentario.save()
      redirect_to(post_path(params['commentary']['post_id']))
    elsif params.key?('reply')
      new_comentario = Commentary.create(text: params['reply']['text'],
                                         user_id: current_user.id)
      new_comentario.commentary << Commentary.find(params['commentary_id'].to_i)
      redirect_back(fallback_location: forum_path())
    else
      redirect_back(fallback_location: root_path())
    end
  end
end
