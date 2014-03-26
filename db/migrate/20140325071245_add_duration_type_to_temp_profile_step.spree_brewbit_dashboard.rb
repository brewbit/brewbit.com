# This migration comes from spree_brewbit_dashboard (originally 20140324064619)
class AddDurationTypeToTempProfileStep < ActiveRecord::Migration
  def change
    add_column :temp_profile_steps, :duration_type, :string
  end
end
