# This migration comes from spree_brewbit_dashboard (originally 20130121024837)
class AddDisplayUnitsToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :display_units, :string
  end
end
