require("rspec")
require_relative("../lib/shopping_cart/shopping_cart.rb")

RSpec.describe "testing shopping_cart" do
  before do
    @cart = ShoppingCart.call(id: 1, name: "jacket", price: 200)
  end

  it "The cart should not be empty?" do
    expect(@cart.items.empty?).to eq(false)
  end
end
