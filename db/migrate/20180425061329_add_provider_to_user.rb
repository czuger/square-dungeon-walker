class AddProviderToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string, null: false
    remove_index :users, :uid
    add_index :users, [:provider, :uid], unique: true
  end
end
