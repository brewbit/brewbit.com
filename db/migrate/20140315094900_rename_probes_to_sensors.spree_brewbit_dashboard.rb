# This migration comes from spree_brewbit_dashboard (originally 20140315094138)
class RenameProbesToSensors < ActiveRecord::Migration
  def change
    rename_column :outputs, :probe_id, :sensor_id
    rename_column :probes, :probe_type, :sensor_type
    rename_column :sensor_readings, :probe_id, :sensor_id
    
    rename_table :probes, :sensors
  end
end
