class AddUserIdToDungeonInstance < ActiveRecord::Migration[5.1]
  def change
    add_column :dungeon_instances, :user_id, :integer, null: false
    add_index :dungeon_instances, :user_id
    add_foreign_key :dungeon_instances, :users, column: :user_id
  end
end
