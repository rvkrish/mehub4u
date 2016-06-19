class CreateCoursesVideos < ActiveRecord::Migration
  def change
    create_table :courses_videos, :id => false do |t|
      t.references :course
      t.references :video
    end

    add_index :courses_videos, [:course_id, :video_id],
      name: "courses_videos_index",
      unique: true
  end
end
