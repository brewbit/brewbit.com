# This migration comes from spree_brewbit_dashboard (originally 20140311064702)
class DropApiKeys < ActiveRecord::Migration
  def change
    drop_table :api_keys
  end
end
