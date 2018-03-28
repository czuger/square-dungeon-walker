class AddDifficultyToDungeonInstance < ActiveRecord::Migration[5.1]
  def change
    add_column :dungeon_instances, :difficulty, :string, null: false, default: :medium
    add_column :dungeon_instances, :hero1_level, :integer, null: false, default: 1
    add_column :dungeon_instances, :hero2_level, :integer
    add_column :dungeon_instances, :hero3_level, :integer
    add_column :dungeon_instances, :hero4_level, :integer
    add_column :dungeon_instances, :hero5_level, :integer
    add_column :dungeon_instances, :hero6_level, :integer
  end
end
