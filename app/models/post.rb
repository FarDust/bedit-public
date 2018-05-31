class Post < ApplicationRecord
  belongs_to(:category)
  has_many(:commentary, dependent: :destroy)
  searchable do
    text :title, :content
    text :commentary do
      commentary.map(&:text)
    end

    boolean :featured
    integer :category_id
    # double  :average_rating
    time    :created_at
    time    :updated_at
  end
end
