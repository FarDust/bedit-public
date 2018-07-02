class CommentariesController < ApplicationController
  before_action(:authenticate_user!, except: [:show])

  def index
  end

  def show
  end

  def create
    if params.key?('commentary')
      create_commentary(params['commentary'])
    elsif params.key?('reply')
      create_reply(params)
    end
    redirect_back(fallback_location: forum_path())
  end

  def create_commentary(commentary)
    new_comentary = Commentary.create(
      text: commentary['text'],
      post_id: commentary['post_id'],
      user_id: commentary['user_id']
    )
    new_comentary.user = current_user
    new_comentary.save()
  end

  def create_reply(reply)
    base_commentary = Commentary.find(reply['commentary_id'].to_i)
    new_comentary = Commentary.create(text: reply['reply']['text'],
                                      user_id: current_user.id)
    new_comentary.user = current_user
    new_comentary.save()
    base_commentary.replies.build(response_id: new_comentary.id)
    base_commentary.save()
  end

  def destroy
    @commentary = Commentary.find(params[:id])
    @commentary.delete()
    redirect_back(fallback_location: forum_path(), notice: 'Comentario borrado')
  end

  def like
    find(params)
    if current_user != @commentary.user
      if current_user.liked?(@commentary)
        @commentary.disliked_by(current_user)
      else
        @commentary.liked_by(current_user)
      end
    end
    redirect_self_path(@commentary)
  end

  def dislike
    find(params)
    if current_user != @commentary.user
      if current_user.disliked?(@commentary)
        @commentary.liked_by(current_user)
      else
        @commentary.disliked_by(current_user)
      end
    end
    redirect_self_path(@commentary)
  end

  private

  def get_parent_path(commentary)
    post_path(Commentary.find_parent_id(commentary))
  end

  def redirect_self_path(commentary)
    redirect_to(get_parent_path(commentary) + '#commentary-' + commentary.id.to_s)
  end

  def find(params)
    @commentary = Commentary.find(params[:id])
    @commentary
  end
end
