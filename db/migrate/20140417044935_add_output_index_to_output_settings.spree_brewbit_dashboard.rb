# This migration comes from spree_brewbit_dashboard (originally 20140417044825)
class AddOutputIndexToOutputSettings < ActiveRecord::Migration
  def change
    add_column :output_settings, :output_index, :integer
  end
end
