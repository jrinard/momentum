class CreateReventExceptions < ActiveRecord::Migration[5.0]
  def change
    create_table :revent_exceptions do |t|
      t.references :revent, foreign_key: true
      t.datetime :time

      t.timestamps
    end
  end
end
