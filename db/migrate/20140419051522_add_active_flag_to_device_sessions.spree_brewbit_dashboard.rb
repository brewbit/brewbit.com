# This migration comes from spree_brewbit_dashboard (originally 20140419051452)
class AddActiveFlagToDeviceSessions < ActiveRecord::Migration
  def change
    add_column :device_sessions, :active, :boolean
  end
end
