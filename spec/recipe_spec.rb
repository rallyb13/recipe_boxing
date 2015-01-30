require('spec_helper')

describe(Recipe) do
  it { should have_and_belong_to_many(:categories) }
  it { should have_many(:instructions)}
  it { should have_and_belong_to_many(:ingredients)}

  # it("will have a category") do
  #   test_recipe1 = Recipe.create({:dish => "spaghetti", :rating => 3})
  #   expect(Recipe.all()).to(eq([]))
  # end
  #can this be done??? cross-class validation

  it('will ensure that only a rating 1 through 5 is entered') do
    test_recipe1 = Recipe.create({:dish => "spaghetti", :rating => 3})
    test_recipe2 = Recipe.create({:dish => "blueberry pi", :rating => 6})
    expect(Recipe.all()).to(eq([test_recipe1]))
  end

  describe('.best') do
    it('will create a list of only the 5-star recipes') do
      test_recipe1 = Recipe.create({:dish => "Javascript Meatloaf", :rating => 2})
      test_recipe2 = Recipe.create({:dish => "Rake Cake", :rating => 5})
      expect(Recipe.best()).to(eq([test_recipe2]))
    end
  end

  describe(".good") do
    it("will return a list of recipes with 4 or 5 stars") do
      test_recipe1 = Recipe.create({:dish => "Rake Cake", :rating => 5})
      test_recipe2 = Recipe.create({:dish => "Specghatti", :rating => 4})
      test_recipe3 = Recipe.create({:dish => "Pretzels", :rating => 3})
      expect(Recipe.good()).to(eq([test_recipe1, test_recipe2]))
    end
  end
end
