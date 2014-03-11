# This migration comes from spree_brewbit_dashboard (originally 20130122040636)
class AddTriggersToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :upper_trigger, :decimal
    add_column :devices, :lower_trigger, :decimal
  end
end
