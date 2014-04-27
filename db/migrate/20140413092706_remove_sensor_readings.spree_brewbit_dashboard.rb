# This migration comes from spree_brewbit_dashboard (originally 20140413092102)
class RemoveSensorReadings < ActiveRecord::Migration
  def change
    drop_table :sensor_readings
  end
end
