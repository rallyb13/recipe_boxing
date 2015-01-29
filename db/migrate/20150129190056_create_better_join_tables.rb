class CreateBetterJoinTables < ActiveRecord::Migration
  def change
    drop_table(:cookbook)

    create_table(:categories_recipes) do |t|
      t.column(:category_id, :integer)
      t.column(:recipe_id, :integer)

      t.timestamps
    end
    add_index(:categories_recipes, :category_id)
    add_index(:categories_recipes, :recipe_id)

    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)

      t.timestamps
    end

    add_index(:ingredients_recipes, :ingredient_id)
    add_index(:ingredients_recipes, :recipe_id)
  end
end
