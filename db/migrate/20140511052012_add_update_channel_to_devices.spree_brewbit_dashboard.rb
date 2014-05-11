# This migration comes from spree_brewbit_dashboard (originally 20140511051901)
class AddUpdateChannelToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :update_channel, :string, default: 'stable'
  end
end
