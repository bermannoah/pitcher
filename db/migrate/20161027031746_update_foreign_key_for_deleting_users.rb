class UpdateForeignKeyForDeletingUsers < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :pitches, :users
    
    add_foreign_key :pitches, :users, on_delete: :cascade
  end
end
