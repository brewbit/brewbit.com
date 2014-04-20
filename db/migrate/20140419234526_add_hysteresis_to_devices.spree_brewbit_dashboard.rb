# This migration comes from spree_brewbit_dashboard (originally 20140419234009)
class AddHysteresisToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :hysteresis, :float
  end
end
