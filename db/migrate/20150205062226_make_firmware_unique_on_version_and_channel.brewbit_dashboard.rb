# This migration comes from brewbit_dashboard (originally 20150205061809)
class MakeFirmwareUniqueOnVersionAndChannel < ActiveRecord::Migration
  def up
    remove_index :firmwares, :version
    add_index :firmwares, [:version, :channel], unique: true
  end
  
  def down
    remove_index :firmwares, column: [:version, :channel]
    add_index :firmwares, :version, unique: true
  end
end
