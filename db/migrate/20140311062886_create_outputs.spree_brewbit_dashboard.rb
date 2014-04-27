# This migration comes from spree_brewbit_dashboard (originally 20130714042245)
class CreateOutputs < ActiveRecord::Migration
  def change
    create_table :outputs do |t|
      t.string :function
      t.string :state
      t.references :device

      t.timestamps
    end
    add_index :outputs, :device_id
  end
end
