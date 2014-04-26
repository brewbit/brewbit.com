# This migration comes from spree_brewbit_dashboard (originally 20121231224817)
class CreateBrews < ActiveRecord::Migration
  def change
    create_table :brews do |t|
      t.string :name
      t.date :date_started
      t.date :date_ended
      t.references :user

      t.timestamps
    end
  end
end
