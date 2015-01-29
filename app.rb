require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
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
