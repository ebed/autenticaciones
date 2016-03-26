class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :ficha_id
      t.date :fecha
      t.integer :tipo_id

      t.timestamps null: false
    end
  end
end
