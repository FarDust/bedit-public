class AddFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.string(:user_id)
      t.string(:post_id)
    end
  end
end
