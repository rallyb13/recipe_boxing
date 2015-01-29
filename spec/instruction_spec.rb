require('spec_helper')

describe(Instruction) do
  it {should belong_to(:recipe) }


  it("will capitalize the first letter of the instructions") do
    new_instruction = Instruction.create({:step => "open the microwave."})   
    expect(new_instruction.step()).to(eq("Open the microwave."))
  end

end
