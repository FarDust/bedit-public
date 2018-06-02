class AddSubcribeToFavourites < ActiveRecord::Migration[5.1]
  def change
    add_column(:favourites, :isSubcribe, :bool, null: false, default: false)
  end
end
