require('spec_helper')

describe(Ingredient) do
  it { should have_and_belong_to_many(:recipes)}

  it("will return only lower-cased ingredients") do
    test_ingredient = Ingredient.create(:element => "Data Chips")
    expect(test_ingredient.element()).to(eq("data chips"))
  end
end
