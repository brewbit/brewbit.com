# This migration comes from brewbit_dashboard (originally 20150208064445)
class AddAlertFieldsToDeviceSession < ActiveRecord::Migration
  def change
    add_column :device_sessions, :high_temp_threshold, :float
    add_column :device_sessions, :low_temp_threshold, :float
    add_column :device_sessions, :comms_loss_threshold, :integer
  end
end
