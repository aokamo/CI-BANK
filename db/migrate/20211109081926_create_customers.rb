class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_num
      t.text :address
      t.text :allergy
      t.text :note
      t.boolean :is_active
      t.string :age

      t.timestamps
    end
  end
end
