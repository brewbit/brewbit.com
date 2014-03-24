# This migration comes from spree_brewbit_dashboard (originally 20140324225217)
class AddStartValueToTempProfile < ActiveRecord::Migration
  def change
    add_column :temp_profiles, :start_value, :float
  end
end
