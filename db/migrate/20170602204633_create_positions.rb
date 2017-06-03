class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.references :department, foreign_key: true
      t.references :part, foreign_key: true

      t.boolean :head
      t.boolean :leader
      t.boolean :worker

      t.timestamps
    end
  end
end
