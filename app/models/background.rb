class Background < ApplicationRecord
  belongs_to(:category, dependent: :destroy)
end
