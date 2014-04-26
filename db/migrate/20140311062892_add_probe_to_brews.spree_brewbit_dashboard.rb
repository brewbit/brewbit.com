# This migration comes from spree_brewbit_dashboard (originally 20130807071825)
class AddProbeToBrews < ActiveRecord::Migration
  def change
    add_column :brews, :probe_id, :integer
    add_index :brews, :probe_id
  end
end
