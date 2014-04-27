# This migration comes from spree_brewbit_dashboard (originally 20130204080947)
class AddSignalStrengthToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :signal_strength, :decimal
  end
end
