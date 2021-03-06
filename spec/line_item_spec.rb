require("rspec")
require_relative("../lib/cart/line_item.rb")
require_relative("../lib/cart/product.rb")

RSpec.describe "testing line_item" do
  before do
    @product = Cart::Product.new(1, "jacket", 300)
    @line_item = Cart::LineItem.new(@product, 1)
  end

  it "should increase the quantity" do
    @line_item.increase

    expect(@line_item.quanitity).to eq(2)
  end

  it "should decrease the quantity" do
    @line_item.decrease

    expect(@line_item.quanitity).to eq(0)
  end

  it "should return true if quantity is zero?" do
    @line_item.decrease

    expect(@line_item.quanitity_zero?).to eq(true)
  end
end
