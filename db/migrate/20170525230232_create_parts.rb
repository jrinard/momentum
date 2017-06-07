class CreateParts < ActiveRecord::Migration[5.0]
    def change
      create_table :parts do |t|
        t.string :title
        t.string :firstname
        t.string :lastname
        t.string :allergies
        t.string :parent
        t.date :birthdate
        t.boolean :backcheck
        t.string :notes
        t.boolean :member
        t.boolean :leader
        t.integer :unit_id

        t.timestamps
      end
    end
  end
