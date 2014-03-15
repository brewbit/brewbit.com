# This migration comes from spree_brewbit_dashboard (originally 20140315181440)
class RenameSensorTypeToIndex < ActiveRecord::Migration
  def change
    rename_column :sensors, :sensor_type, :sensor_index
  end
end
