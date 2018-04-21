class User < ApplicationRecord
  has_many(:publication)
end
