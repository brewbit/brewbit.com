# This migration comes from spree_brewbit_dashboard (originally 20140315092615)
class RenameTemperaturesToSensorReadings < ActiveRecord::Migration
  def change
    rename_table :temperatures, :sensor_readings
  end
end
