class AddPostIdFix < ActiveRecord::Migration[5.1]
  def change
    add_column(:commentaries, :post_id, :bigint)
  end
end
