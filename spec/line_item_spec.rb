require("rspec")
require_relative("../lib/line_item.rb")
require_relative("../lib/product.rb")

RSpec.describe "testing line_item" do
  before do
    @product = Product.new(1, "jacket", 300)
    @line_item = LineItem.new(@product, 1)
  end

  it "should increase the quantity" do
    @line_item.increase

    expect(@line_item.quanitity).to eq(2)
  end

  it "should decrease the quantity" do
    @line_item.decrease

    expect(@line_item.quanitity).to eq(0)
  end
end
