# This migration comes from spree_brewbit_dashboard (originally 20131006113716)
class AddTemperatureScaleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :temperature_scale, :string, default: 'fahrenheit'
  end
end
