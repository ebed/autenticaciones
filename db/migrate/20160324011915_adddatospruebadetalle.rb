class Adddatospruebadetalle < ActiveRecord::Migration
  def change
    add_column :tests, :detalle, :string
  end
end
