# This migration comes from spree_brewbit_dashboard (originally 20130131062534)
class AddLastKnownTemperatureToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :last_known_temperature, :decimal
  end
end
