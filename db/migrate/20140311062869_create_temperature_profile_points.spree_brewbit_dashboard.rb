# This migration comes from spree_brewbit_dashboard (originally 20130520025722)
class CreateTemperatureProfilePoints < ActiveRecord::Migration
  def change
    create_table :temperature_profile_points do |t|
      t.decimal :start_minute
      t.decimal :start_hour
      t.decimal :start_day
      t.integer :temperature_profile_point_id
      t.decimal :temperature
      t.string :temperature_scale
      t.string :transition_type

      t.timestamps
    end
  end
end
