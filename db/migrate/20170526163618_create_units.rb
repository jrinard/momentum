class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :familyName
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :phonePrimary
      t.string :phoneSecondary
      t.string :emailPrimary
      t.string :emailSecondary
      t.string :notes
      t.integer :user_id
    end
  end
end
