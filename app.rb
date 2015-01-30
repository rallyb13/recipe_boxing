require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
  @five_star_recipes = Recipe.best()
  erb(:index)
end

post('/categories') do
  name = params['name']
  Category.create({:name => name})
  redirect('/')
end

post('/recipes') do
  dish = params['dish']
  rating = params['rating'].to_i()
  recipe = Recipe.create({:dish => dish, :rating => rating})
  categories = params.fetch("category_ids")
  categories.each() do |category_id|
    category = Category.find(category_id.to_i())
    recipe.categories() << category
  end
  redirect('/')
end

get('/category/:id') do
  cat_id = params['id']
  @category = Category.find(cat_id)
  erb(:category)
end

get('/recipe/:id') do
  recipe_id = params['id']
  @recipe = Recipe.find(recipe_id)
  erb(:recipe)
end

post('/instructions') do
  step = params['step']
  rec_id = params['recipe_id']
  recipe = Recipe.find(rec_id)
  new_step = Instruction.create({:step => step})
  recipe.instructions << new_step
  redirect back
end

get('/ingredients') do
  @recipes = Recipe.all()
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post('/ingredients') do
  element = params['element']
  Ingredient.create({:element => element})
  redirect back
end

post('/ingredient_add') do
  recipe = Recipe.find(params['recipe_id'])
  ingredients = params.fetch("ingredient_ids")
  ingredients.each() do |ingredient_id|
    ingredient = Ingredient.find(ingredient_id)
    recipe.ingredients() << ingredient
  end
  redirect back
end
