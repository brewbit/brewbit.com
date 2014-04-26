# This migration comes from spree_brewbit_dashboard (originally 20140314044015)
class DropDeviceConnection < ActiveRecord::Migration
  def change
    drop_table :device_connections
  end
end
