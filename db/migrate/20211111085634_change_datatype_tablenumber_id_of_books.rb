class ChangeDatatypeTablenumberIdOfBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :tablenumber_id, :integer
  end
end
