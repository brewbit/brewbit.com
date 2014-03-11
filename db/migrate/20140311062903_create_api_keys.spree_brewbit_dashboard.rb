# This migration comes from spree_brewbit_dashboard (originally 20140104214015)
class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.references :user

      t.timestamps
    end
    add_index :api_keys, :user_id
    add_index :api_keys, :access_token
  end
end
