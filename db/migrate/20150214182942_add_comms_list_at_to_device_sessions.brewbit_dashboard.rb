# This migration comes from brewbit_dashboard (originally 20150214182743)
class AddCommsListAtToDeviceSessions < ActiveRecord::Migration
  def change
    add_column :device_sessions, :comms_lost_at, :datetime
  end
end
