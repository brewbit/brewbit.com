# This migration comes from spree_brewbit_dashboard (originally 20130203235920)
class AddOutputsToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :left_output, :string
    add_column :devices, :right_output, :string
  end
end
