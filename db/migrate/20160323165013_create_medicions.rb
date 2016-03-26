class CreateMedicions < ActiveRecord::Migration
  def change
    create_table :medicions do |t|
      t.integer :ficha_id
      t.integer :metrica_id
      t.string :valor
      t.string :observacion

      t.timestamps null: false
    end
  end
end
