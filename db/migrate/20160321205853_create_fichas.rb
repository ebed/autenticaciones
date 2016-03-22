class CreateFichas < ActiveRecord::Migration
  def change
    create_table :fichas do |t|
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
