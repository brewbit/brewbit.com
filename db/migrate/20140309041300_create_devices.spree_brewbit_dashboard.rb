# This migration comes from spree_brewbit_dashboard (originally 20140309041212)
class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :user_id
      t.string :hardware_id
      t.string :activation_token

      t.timestamps
    end
  end
end
