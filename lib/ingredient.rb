class Ingredient < ActiveRecord::Base

  has_and_belongs_to_many(:recipes)
  before_save(:downcase_element)


private

  define_method(:downcase_element) do
    self.element=(element().downcase())
  end

end
