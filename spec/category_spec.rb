require('spec_helper')

describe(Category) do
  it{should have_and_belong_to_many(:recipes)}

  it("will ensure a category has a name") do
    new_category = Category.new({:name => ""})
    expect(new_category.save()).to(eq(false))
  end

end
