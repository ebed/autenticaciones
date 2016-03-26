class CreateTestInstances < ActiveRecord::Migration
  def change
    create_table :test_instances do |t|
      t.integer :test_id
      t.date :fecha
      t.integer :ficha_id

      t.timestamps null: false
    end
  end
end
