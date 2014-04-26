# This migration comes from spree_brewbit_dashboard (originally 20140419060449)
class AddUuidToDeviceSessions < ActiveRecord::Migration
  def change
    add_column :device_sessions, :uuid, :string
  end
end
