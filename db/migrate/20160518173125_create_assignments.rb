class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.text :topic

      t.timestamps null: false
    end
  end
end
