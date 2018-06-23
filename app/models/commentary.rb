class Commentary < ApplicationRecord
  acts_as_votable()
  # belongs_to(:post)
  belongs_to(:user)
  # http://http://railscasts.com/episodes/163-self-referential-association
  has_many(:replies)
  has_many(:responses, through: :replies)
  has_many(:inverse_replies, class_name: 'Reply', foreign_key: 'response_id')
  has_many(:inverse_responses, through: :inverse_replies, source: :commentary)

  after_commit(:create_notifications, on: [:create])

  def create_notifications
    if !post_id.nil?
      to_nofify = Favourite.where(post: Post.find(post_id), isSubcribe: true)
      for subcrition in to_nofify do
        next if subcrition.user == user
        Notification.create(
          notify_type: 'comment',
          actor: user,
          user: subcrition.user,
          target: self
        )
      end
    end
  end

  def get_parent_post
    if !post_id.nil?
      Post.find(post_id)
    else
      Post.find(Commentary.find_parent_id(self))
    end
  end

  def self.find_parent_id(commentary)
    if !commentary.post_id.nil?
      commentary.post_id
    else
      for reply in commentary.inverse_responses
        if !reply.post_id.nil?
          return reply.post_id
        else
          return Commentary.find_parent_id(reply)
        end
      end
    end
  end

  def votes
    get_likes.size - get_dislikes.size
  end

  def self.sort_by_votes(params)
    @comentarios = sort_by_date(params)
    @comentarios = Commentary.where(post_id: params[:id]).sort_by do |x|
      (x.get_likes.size - x.get_dislikes.size)
    end .reverse!
  end

  def self.sort_by_date(params)
    @comentarios = Commentary.where(post_id: params[:id]).sort_by(&:created_at) .reverse!
  end
end
