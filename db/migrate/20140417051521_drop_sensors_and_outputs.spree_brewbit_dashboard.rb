# This migration comes from spree_brewbit_dashboard (originally 20140417051028)
class DropSensorsAndOutputs < ActiveRecord::Migration
  def change
    drop_table :sensors
    drop_table :outputs
    remove_column :output_settings, :output_id
    remove_column :output_settings, :sensor_id
  end
end
