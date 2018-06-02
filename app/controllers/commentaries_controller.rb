class CommentariesController < ApplicationController
  before_action(:authenticate_user!, except: [:show])
  def index
  end

  def create
    if params.key?('commentary')
      flash[:notice] = "Added friend."
      new_comentario = Commentary.create(
        post_id: params['commentary']['post_id'],
        text: params['commentary']['text'],
        user_id: params['commentary']['user_id']
      )
      new_comentario.post = Post.find(params['commentary']['post_id'].to_i)
      new_comentario.user = current_user
      new_comentario.save()
    elsif params.key?('reply')
      base_commentary = Commentary.find(params['commentary_id'].to_i)
      new_comentario = Commentary.create(text: params['reply']['text'],
                                         user_id: current_user.id)
      new_comentario.user = current_user
      new_comentario.save()
      base_commentary.replys.build(reply_id: new_comentario.id)
      base_commentary.save()
    end
    redirect_back(fallback_location: forum_path())
  end
end
