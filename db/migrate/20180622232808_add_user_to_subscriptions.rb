class AddUserToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :user, :belogns_to
  end
end
