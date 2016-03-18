class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.date :dob
      t.integer :location_id
      t.timestamps null: false
    end

    rename_column :patients, :person_id, :persona_id
    rename_column :specialists, :person_id, :persona_id
    rename_column :locations, :person_id, :persona_id


  end
end
