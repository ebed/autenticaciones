class AddRutPersona < ActiveRecord::Migration
  def change
    add_column :personas, :rut, :integer
    add_column :personas, :dv, :integer

  end
end
