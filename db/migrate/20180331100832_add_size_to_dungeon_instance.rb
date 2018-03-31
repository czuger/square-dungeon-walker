class AddSizeToDungeonInstance < ActiveRecord::Migration[5.1]
  def change
    add_column :dungeon_instances, :size, :integer, null: false, default: 5
  end
end
