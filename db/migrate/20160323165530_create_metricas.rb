class CreateMetricas < ActiveRecord::Migration
  def change
    create_table :metricas do |t|
      t.string :nombre
      t.string :detalle

      t.timestamps null: false
    end
  end
end
