# This migration comes from brewbit_dashboard (originally 20150210095833)
class RemoveAudits < ActiveRecord::Migration
  def change
    drop_table :audits
  end
end
