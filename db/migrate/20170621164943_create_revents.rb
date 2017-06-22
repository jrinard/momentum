class CreateRevents < ActiveRecord::Migration[5.0]
  def change
    create_table :revents do |t|
      t.string :name
      t.datetime :start_time
      t.text :recurring

      t.string :description
      t.string :locationname
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country

      t.integer :attendance
      t.integer :volunteers

      t.timestamps
    end
  end
end
