class AddStatusesToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :pitches, :status
    
    add_reference :pitches, :status, index: true, foreign_key: true
  end
end
