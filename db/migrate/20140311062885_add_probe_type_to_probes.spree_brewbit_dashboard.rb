# This migration comes from spree_brewbit_dashboard (originally 20130714015143)
class AddProbeTypeToProbes < ActiveRecord::Migration
  def change
    add_column :probes, :probe_type, :string
  end
end
