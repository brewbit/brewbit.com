# This migration comes from spree_brewbit_dashboard (originally 20130522205155)
class CreateTemperatureProfiles < ActiveRecord::Migration
  def change
    create_table :temperature_profiles do |t|
      t.string :name
      t.references :user
      t.references :brew

      t.timestamps
    end
    add_index :temperature_profiles, :user_id
    add_index :temperature_profiles, :brew_id
  end
end
