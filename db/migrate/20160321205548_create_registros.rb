class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.date :fecha
      t.integer :ficha_id
      t.integer :specialist_id
      t.string :resumen
      t.string :detalle

      t.timestamps null: false
    end
  end
end
