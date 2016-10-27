class AddStatusesToPitches < ActiveRecord::Migration[5.0]
  def change
    add_reference :pitches, :status, index: true, foreign_key: true
  end
end
