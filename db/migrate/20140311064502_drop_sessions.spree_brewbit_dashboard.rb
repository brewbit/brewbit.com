# This migration comes from spree_brewbit_dashboard (originally 20140311064354)
class DropSessions < ActiveRecord::Migration
  def change
    drop_table :sessions
  end
end
