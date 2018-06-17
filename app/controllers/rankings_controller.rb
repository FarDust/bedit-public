class RankingsController < ApplicationController
    
    def users
      @users = User.all().sort_by({ |user| [user.reputation] })[0..50]
    end

    def posts
    end

    def categories
    end
    
end