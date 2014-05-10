# This migration comes from spree_brewbit_dashboard (originally 20140510000826)
class AddCurrentStatusToDeviceSessions < ActiveRecord::Migration
  def change
    add_column :device_sessions, :last_reading, :float
    add_column :device_sessions, :last_setpoint, :float
  end
end
