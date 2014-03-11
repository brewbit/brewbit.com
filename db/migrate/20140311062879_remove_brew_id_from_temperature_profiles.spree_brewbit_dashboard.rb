# This migration comes from spree_brewbit_dashboard (originally 20130629005345)
class RemoveBrewIdFromTemperatureProfiles < ActiveRecord::Migration
  def up
    remove_column :temperature_profiles, :brew_id
  end

  def down
    add_column :temperature_profiles, :brew_id, :integer
    add_index :temperature_profiles, :brew_id
  end
end
