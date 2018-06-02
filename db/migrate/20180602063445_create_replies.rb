class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.integer :commetary_id
      t.integer :reply_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
