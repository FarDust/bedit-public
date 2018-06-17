class CommentariesController < ApplicationController
  before_action(:authenticate_user!, except: [:show])
  def index
  end

  def show
  end

  def create
    if params.key?('commentary')
      new_comentary = Commentary.create(
        post_id: params['commentary']['post_id'],
        text: params['commentary']['text'],
        user_id: params['commentary']['user_id']
      )
      # new_comentary.post = Post.find(params['commentary']['post_id'].to_i)
      new_comentary.user = current_user
      new_comentary.save()
    elsif params.key?('reply')
      base_commentary = Commentary.find(params['commentary_id'].to_i)
      new_comentary = Commentary.create(text: params['reply']['text'],
                                        user_id: current_user.id)
      new_comentary.user = current_user
      new_comentary.save()
      base_commentary.replies.build(response_id: new_comentary.id)
      base_commentary.save()
    end
    redirect_back(fallback_location: forum_path())
  end

  def destroy
    @commentary = Commentary.find(params[:id])
    @commentary.delete()
    redirect_back(fallback_location: forum_path(), notice: 'Comentario borrado')
  end

  def like
    @commentary = Commentary.find(params[:id])
    if current_user.liked?(@commentary)
      @commentary.disliked_by(current_user)
    else
      @commentary.liked_by(current_user)
    end
    redirect_back(fallback_location: root_path())
  end

  def dislike
    @commentary = Commentary.find(params[:id])
    if current_user.disliked?(@commentary)
      @commentary.liked_by(current_user)
    else
      @commentary.disliked_by(current_user)
    end
    redirect_back(fallback_location: root_path())
  end
end
