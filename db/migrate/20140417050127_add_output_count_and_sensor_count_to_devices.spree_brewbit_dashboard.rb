# This migration comes from spree_brewbit_dashboard (originally 20140417050045)
class AddOutputCountAndSensorCountToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :output_count, :integer
    add_column :devices, :sensor_count, :integer
  end
end
