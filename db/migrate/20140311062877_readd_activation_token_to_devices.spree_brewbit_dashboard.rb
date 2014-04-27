# This migration comes from spree_brewbit_dashboard (originally 20130603055059)
class ReaddActivationTokenToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :activation_token, :string
    add_index :devices, :activation_token
  end
end
