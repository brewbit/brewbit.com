# This migration comes from spree_brewbit_dashboard (originally 20130811000927)
class RemoveLastTemperatureFromProbes < ActiveRecord::Migration
  def up
    remove_column :probes, :last_temperature
  end

  def down
    add_column :probes, :last_temperature, :decimal
  end
end
