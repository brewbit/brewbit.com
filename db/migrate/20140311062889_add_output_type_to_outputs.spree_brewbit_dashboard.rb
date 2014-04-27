# This migration comes from spree_brewbit_dashboard (originally 20130714062321)
class AddOutputTypeToOutputs < ActiveRecord::Migration
  def change
    add_column :outputs, :output_type, :string
  end
end
