# This migration comes from spree_brewbit_dashboard (originally 20140324184513)
class AddOutputModeToOutputs < ActiveRecord::Migration
  def change
    add_column :outputs, :output_mode, :integer
  end
end
