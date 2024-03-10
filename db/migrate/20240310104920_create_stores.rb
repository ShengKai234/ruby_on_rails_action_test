class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :title
      t.string :tel
      t.string :address
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
