class CreateBackgrounds < ActiveRecord::Migration[5.1]
  def change
    create_table :backgrounds do |t|
      t.references(:category)
      t.text(:url)
      t.timestamps
    end
  end
end
