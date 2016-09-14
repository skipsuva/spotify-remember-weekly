class AddJsonColumnToUserTable < ActiveRecord::Migration
  def change
    rename_table :users_tables, :users
    add_column :users, :spotify_user_hash, :json
  end
end
