# This migration comes from spree_brewbit_dashboard (originally 20130602063817)
class AddHardwareIdentifierToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :hardware_identifier, :string
    add_index :devices, :hardware_identifier
  end
end
