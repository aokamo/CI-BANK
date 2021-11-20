class CreateTablenumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :tablenumbers do |t|
      t.string :name

      t.timestamps
    end
  end
end
