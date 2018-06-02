class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.integer :commentary_id
      t.integer :response_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
