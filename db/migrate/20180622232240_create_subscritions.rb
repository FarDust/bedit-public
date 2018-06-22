class CreateSubscritions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscritions do |t|

      t.timestamps
    end
  end
end
