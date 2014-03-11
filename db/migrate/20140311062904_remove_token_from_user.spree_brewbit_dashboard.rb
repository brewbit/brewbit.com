# This migration comes from spree_brewbit_dashboard (originally 20140104223557)
class RemoveTokenFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :authentication_token
  end

  def down
    add_column :users, :authentication_token, :string
    add_index :users, :authentication_token, unique: true
  end
end
