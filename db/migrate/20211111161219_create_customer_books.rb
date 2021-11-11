class CreateCustomerBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_books do |t|
      t.integer :customer_id
      t.integer :book_id

      t.timestamps
    end
  end
end
