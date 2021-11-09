class AddBookIdToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :book_id, :integer
  end
end
