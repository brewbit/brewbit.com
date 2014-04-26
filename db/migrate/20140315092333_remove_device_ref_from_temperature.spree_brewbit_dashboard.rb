# This migration comes from spree_brewbit_dashboard (originally 20140315091318)
class RemoveDeviceRefFromTemperature < ActiveRecord::Migration
  def change
     remove_column :temperatures, :device_id
  end
end
