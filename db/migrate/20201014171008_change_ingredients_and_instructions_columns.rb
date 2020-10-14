class ChangeIngredientsAndInstructionsColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :ingredients, :string
    change_column :recipes, :instructions, :string
  end
end
