# This migration comes from spree_brewbit_dashboard (originally 20140406191950)
class AddSetpointToSensorReport < ActiveRecord::Migration
  def change
    add_column :sensor_readings, :setpoint, :float
  end
end
