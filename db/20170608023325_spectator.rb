class Spectators < ActiveRecord::Migration[5.0]
  def change
    create_table :spectators do |t|
      t.references :event, foreign_key: true
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
