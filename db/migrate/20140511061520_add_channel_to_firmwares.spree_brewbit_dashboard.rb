# This migration comes from spree_brewbit_dashboard (originally 20140511061455)
class AddChannelToFirmwares < ActiveRecord::Migration
  def change
    add_column :firmwares, :channel, :string
  end
end
