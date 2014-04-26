# This migration comes from spree_brewbit_dashboard (originally 20131227025927)
class CreateFirmwares < ActiveRecord::Migration
  def change
    create_table :firmwares do |t|
      t.string :version
      t.integer :size

      t.timestamps
    end
  end
end
