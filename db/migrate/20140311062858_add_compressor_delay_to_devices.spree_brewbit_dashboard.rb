# This migration comes from spree_brewbit_dashboard (originally 20130122033550)
class AddCompressorDelayToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :compressor_delay, :integer
  end
end
