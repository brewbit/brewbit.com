# This migration comes from spree_brewbit_dashboard (originally 20121227092156)
class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :devices, :user_id
  end
end
