class CreateTables < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:recipes) do |t|
      t.column(:dish, :string)
      t.column(:rating, :integer)

      t.timestamps
    end

    add_index(:recipes, :rating)

    create_table(:ingredients) do |t|
      t.column(:element, :string)
    end

    create_table(:instructions) do |t|
      t.column(:step, :string)
      t.column(:recipe_id, :integer)
    end

    create_table(:cookbook) do |t|
      t.column(:category_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)

      t.timestamps
    end

    add_index(:cookbook, :category_id)
    add_index(:cookbook, :ingredient_id)
    add_index(:cookbook, :recipe_id)

  end
end
