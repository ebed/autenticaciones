class CambiarAsociacionFichaTestInstancia < ActiveRecord::Migration
  def change
    remove_column :test_instances, :ficha_id
    add_column :test_instances, :registro_id, :integer
  end
end
