# This migration comes from spree_brewbit_dashboard (originally 20121227065124)
class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
  end
end
