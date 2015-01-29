class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  has_many(:instructions)
  has_and_belongs_to_many(:ingredients)

  validates(:rating, {:inclusion => 1..5})

  scope(:best, -> do
    where({:rating => 5})
  end)

  scope(:good, -> do
    where({:rating => 4..5})
  end)
end
