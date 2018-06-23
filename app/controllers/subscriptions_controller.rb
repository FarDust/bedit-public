class SubscriptionsController < ApplicationController
    def create
        new_favourite = Subscription.create(
            user: current_user,
            post: Post.find(params['post_id'])
        ).save()
        redirect_back(fallback_location: forum_path())
    end

    def delete
        Subscription.where(post_id: params['post_id'], user: current_user).delete_all()
        redirect_back(fallback_location: forum_path())
    end
end
