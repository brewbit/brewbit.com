# This migration comes from spree_brewbit_dashboard (originally 20131227220925)
class AddBinaryFileToFirmwares < ActiveRecord::Migration
  def change
    add_column :firmwares, :file, :binary
  end
end
