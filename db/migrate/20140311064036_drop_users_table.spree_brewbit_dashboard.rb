# This migration comes from spree_brewbit_dashboard (originally 20140311063956)
class DropUsersTable < ActiveRecord::Migration
  def change
    drop_table :users
  end
end
