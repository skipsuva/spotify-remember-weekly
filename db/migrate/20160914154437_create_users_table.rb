class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users_tables do |t|
      t.string :name
      t.integer :spotify_id
      t.string :spotify_access_token
    end
  end
end
