# This migration comes from spree_brewbit_dashboard (originally 20140321071313)
class AddOutputIndexToOutput < ActiveRecord::Migration
  def change
    add_column :outputs, :output_index, :integer
    add_index :outputs, :output_index
  end
end
