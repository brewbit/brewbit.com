# This migration comes from spree_brewbit_dashboard (originally 20130927101534)
class RemoveStateFromOutput < ActiveRecord::Migration
  def up
    remove_column :outputs, :state
  end

  def down
    add_column :outputs, :state, :string
  end
end
