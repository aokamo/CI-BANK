class CreateBookCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :book_courses do |t|
      t.integer :book_id
      t.integer :courses_id

      t.timestamps
    end
  end
end
