require("rspec")
require_relative("../lib/cart/product.rb")

RSpec.describe "testing product" do
  before do
    @product = Cart::Product.new(1, "jacket", 300)
  end

  it "product should have a name" do
    expect(@product.name).to eq("jacket")
  end

  it "product should have a price" do
    expect(@product.price).to eq(300)
  end

  it "product should have a id" do
    expect(@product.id).to eq(1)
  end
end
