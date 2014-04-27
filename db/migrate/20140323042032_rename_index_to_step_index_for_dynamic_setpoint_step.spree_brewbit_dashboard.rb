# This migration comes from spree_brewbit_dashboard (originally 20140323041816)
class RenameIndexToStepIndexForDynamicSetpointStep < ActiveRecord::Migration
  def up
    rename_column :dynamic_setpoint_steps, :index, :step_index
  end

  def down
    rename_column :dynamic_setpoint_steps, :step_index, :index
  end
end
