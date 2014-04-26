# This migration comes from spree_brewbit_dashboard (originally 20130807052145)
class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.float :value
      t.references :device
      t.references :probe

      t.timestamps
    end

    add_index :temperatures, :device_id
    add_index :temperatures, :probe_id
  end
end
