class AddAllergyToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :allergy, :string
  end
end
