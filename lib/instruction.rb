class Instruction < ActiveRecord::Base
  belongs_to(:recipe)
  before_save(:capitalize_instruction)

  private
    define_method(:capitalize_instruction) do
      self.step=(step.capitalize())
    end

end
