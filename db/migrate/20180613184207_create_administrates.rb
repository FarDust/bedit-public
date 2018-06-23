class CreateAdministrates < ActiveRecord::Migration[5.1]
  def change
    create_table :administrates do |t|
      t.string(:user)
      t.integer(:category)
      t.boolean(:answered)
      t.timestamps
    end
  end
end
