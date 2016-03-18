class AlterIdPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :patient_id, :integer
    add_column :personas, :specialist_id, :integer

  end
end
