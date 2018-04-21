class CreateForums < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.integer :id
      t.string :theme

      t.timestamps
    end
  end
end
