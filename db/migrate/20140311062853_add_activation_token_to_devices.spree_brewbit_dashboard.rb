# This migration comes from spree_brewbit_dashboard (originally 20121230011048)
class AddActivationTokenToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :activation_token, :string
    add_index :devices, :activation_token
  end
end
