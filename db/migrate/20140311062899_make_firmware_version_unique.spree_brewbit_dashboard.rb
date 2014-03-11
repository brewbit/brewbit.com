# This migration comes from spree_brewbit_dashboard (originally 20131229205000)
class MakeFirmwareVersionUnique < ActiveRecord::Migration
  def up
    add_index :firmwares, :version, unique: true
  end

  def down
    remove_index :firmwares, :version
  end
end
