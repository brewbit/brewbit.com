# This migration comes from brewbit_dashboard (originally 20150125075511)
class AddTempProfileCompletionActionToDeviceSession < ActiveRecord::Migration
  def change
    add_column :device_sessions, :temp_profile_completion_action, :integer
  end
end
