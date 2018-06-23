class AddCategoriesIdToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :subscriptions, :category, foreign_key: true
  end
end
