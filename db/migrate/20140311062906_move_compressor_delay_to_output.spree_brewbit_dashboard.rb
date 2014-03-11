# This migration comes from spree_brewbit_dashboard (originally 20140119032548)
class MoveCompressorDelayToOutput < ActiveRecord::Migration
  def up
    remove_column :devices, :compressor_delay

    add_column :outputs, :compressor_delay, :integer
  end

  def down
    add_column :devices, :compressor_delay, :integer
    remove_column :outputs, :compressor_delay
  end
end
