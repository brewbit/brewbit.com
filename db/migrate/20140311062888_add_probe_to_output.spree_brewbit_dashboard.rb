# This migration comes from spree_brewbit_dashboard (originally 20130714050403)
class AddProbeToOutput < ActiveRecord::Migration
  def up
    add_column :probes, :output_id, :integer
    add_index :probes, :output_id
  end

  def down
    remove_column :probes, :output_id
  end
end
