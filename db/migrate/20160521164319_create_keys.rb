class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :name
      t.string :value
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
