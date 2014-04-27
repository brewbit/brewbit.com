# This migration comes from spree_brewbit_dashboard (originally 20140315181802)
class ChangeSensorIndexType < ActiveRecord::Migration
  def up
    remove_column :sensors, :sensor_index
    add_column :sensors, :sensor_index, :integer
  end

  def down
    remove_column :sensors, :sensor_index
    add_column :sensors, :sensor_index, :string
  end
end
