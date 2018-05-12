class AddUserIdCommentaries < ActiveRecord::Migration[5.1]
  def change
    add_column(:commentaries, :user_id, :string)
  end
end
