class CreateParts < ActiveRecord::Migration[5.0]
    def change
      create_table :parts do |t|
        t.string :title
        t.string :firstName
        t.string :lastName
        t.string :allergies
        t.string :parent
        t.date :birthdate
        t.boolean :backCheck
        t.string :notes
        t.boolean :member
        t.boolean :leader
        t.integer :user_id

        t.timestamps
      end
    end
  end
