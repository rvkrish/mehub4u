class CreateAssignmentTrackings < ActiveRecord::Migration
  def change
    create_table :assignment_trackings do |t|
      t.integer :assignment_id
      t.integer :user_id
      t.string :topic
      t.text :solution
      t.string :git_url

      t.timestamps null: false
    end
  end
end
