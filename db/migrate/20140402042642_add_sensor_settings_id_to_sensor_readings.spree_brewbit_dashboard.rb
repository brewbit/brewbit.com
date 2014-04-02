# This migration comes from spree_brewbit_dashboard (originally 20140402042426)
class AddSensorSettingsIdToSensorReadings < ActiveRecord::Migration
  def change
    add_column :sensor_readings, :sensor_settings_id, :integer
    add_index :sensor_readings, :sensor_settings_id
  end
end
