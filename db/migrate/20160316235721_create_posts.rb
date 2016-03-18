class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :text
      t.string :user_id_integer

      t.timestamps null: false
    end
  end
end
