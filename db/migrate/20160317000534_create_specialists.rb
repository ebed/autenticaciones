class CreateSpecialists < ActiveRecord::Migration
  def change
    create_table :specialists do |t|
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
