# This migration comes from spree_brewbit_dashboard (originally 20140322041124)
class RemoveOutputTypeFromOutput < ActiveRecord::Migration
  def up
    remove_column :outputs, :output_type
  end

  def down
    add_column :outputs, :output_type, :string
  end
end
