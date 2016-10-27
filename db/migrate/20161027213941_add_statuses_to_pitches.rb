class AddStatusesToPitches < ActiveRecord::Migration[5.0]
  def change
    add_reference :statuses, :pitch, index: true, foreign_key: true
  end
end
