# This migration comes from spree_brewbit_dashboard (originally 20130128015121)
class AddDeviceToBrew < ActiveRecord::Migration
  def change
    add_column :brews, :device_id, :integer
    add_index :brews, :device_id
  end
end
