class AddPitches < ActiveRecord::Migration[5.0]
  def change
    create_table :pitches do |t|
      t.string :title
      t.text :content
    
      t.timestamps null: false
    end
  end
end
