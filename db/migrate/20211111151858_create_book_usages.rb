class CreateBookUsages < ActiveRecord::Migration[5.2]
  def change
    create_table :book_usages do |t|
      t.integer :book_id
      t.integer :usage_id

      t.timestamps
    end
  end
end
