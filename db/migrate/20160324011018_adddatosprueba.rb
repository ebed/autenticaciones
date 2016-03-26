class Adddatosprueba < ActiveRecord::Migration
  def change
    add_column :tests, :nombre, :string
  end
end
