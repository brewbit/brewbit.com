# This migration comes from spree_brewbit_dashboard (originally 20140327064818)
class ReferenceSensorFromOutputSettings < ActiveRecord::Migration
  def change
    add_column :output_settings, :sensor_id, :integer
    remove_column :output_settings, :sensor_settings_id, :integer
  end
end
