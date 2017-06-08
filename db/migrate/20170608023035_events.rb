class Events < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.date :date
      t.time :starttime
      t.time :endtime
      t.string :locationname
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.boolean :recurring
      t.integer :attendance
      t.integer :volunteers
      t.timestamps
    end
  end
end
