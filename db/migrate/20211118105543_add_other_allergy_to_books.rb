class AddOtherAllergyToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :other_allergy, :string
  end
end
