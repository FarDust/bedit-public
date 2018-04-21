class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.integer :id
      t.string :text
      t.string :type

      t.timestamps
    end
  end
end
