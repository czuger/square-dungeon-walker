class CreateDungeonInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :dungeon_instances do |t|
      t.string :dungeon_data

      t.timestamps
    end
  end
end
