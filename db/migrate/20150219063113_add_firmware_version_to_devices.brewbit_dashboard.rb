# This migration comes from brewbit_dashboard (originally 20150219063025)
class AddFirmwareVersionToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :firmware_version, :string
  end
end
