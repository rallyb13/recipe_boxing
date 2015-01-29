ENV['RACK-ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file}

RSpec.configure() do |config|
  config.after(:each) do
    Category.all().each() do |cat|
      cat.destroy()
    end
    Ingredient.all().each() do |ing|
      ing.destroy()
    end
    Instruction.all().each() do |ins|
      ins.destroy()
    end
    Recipe.all().each() do |rec|
      rec.destroy()
    end
  end
end
