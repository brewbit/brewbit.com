# This migration comes from brewbit_dashboard (originally 20150210074041)
class RenameSessionEventTypeToEventType < ActiveRecord::Migration
  def change
    rename_column :session_events, :type, :event_type
  end
end
