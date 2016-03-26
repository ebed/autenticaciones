class AlterIds < ActiveRecord::Migration
  def change
    add_column :metricas, :test_id, :integer
    remove_column :tests, :fecha
    remove_column :tests, :ficha_id

  end
end
