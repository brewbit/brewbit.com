# This migration comes from spree_brewbit_dashboard (originally 20140311064143)
class DropBrews < ActiveRecord::Migration
  def change
    
    drop_table :brews
  end
end
