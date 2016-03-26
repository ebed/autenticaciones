class AddIdTestInst < ActiveRecord::Migration
  def change
    add_column :medicions, :test_instance_id, :integer
  end
end
