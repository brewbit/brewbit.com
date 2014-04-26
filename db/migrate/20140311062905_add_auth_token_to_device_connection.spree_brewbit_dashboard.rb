# This migration comes from spree_brewbit_dashboard (originally 20140109044633)
class AddAuthTokenToDeviceConnection < ActiveRecord::Migration
  def change
    add_column :device_connections, :auth_token, :string
  end
end
