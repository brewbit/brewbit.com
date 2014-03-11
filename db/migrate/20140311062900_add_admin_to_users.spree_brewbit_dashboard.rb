# This migration comes from spree_brewbit_dashboard (originally 20131229205644)
class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
