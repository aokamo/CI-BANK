class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :customer_id
      t.integer :usage_id
      t.integer :course_id
      t.string :people
      t.string :table_num
      t.datetime :visit_time
      t.text :note
      t.string :drink_fee
      t.string :feast_fee
      t.boolean :no_book

      t.timestamps
    end
  end
end
