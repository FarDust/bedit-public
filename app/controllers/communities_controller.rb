class CommunitiesController < ApplicationController
  def index
    @communities = Category.last(5)
  end
end
