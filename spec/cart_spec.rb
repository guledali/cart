require("rspec")
require_relative("../lib/shopping_cart/cart.rb")
require_relative("../lib/shopping_cart/line_item.rb")
require_relative("../lib/shopping_cart/product.rb")

RSpec.describe "testing cart" do
  before do
    @product = ShoppingCart::Product.new(1, "jacket", 300)
    @line_item = ShoppingCart::LineItem.new(@product, 1)
    @cart = ShoppingCart::Cart.new()
  end

  it "should show the total sum in the cart" do
    @cart.add(@line_item)
    expect(@cart.total_sum).to eq(300)
  end

  it "it should have two product in the cart" do
    @cart.add(@line_item)

    product = ShoppingCart::Product.new(2, "pants", 200)
    line_item = ShoppingCart::LineItem.new(product, 1)
    @cart.add(line_item)

    expect(@cart.total_items).to eq(2)
  end

  it "should display price of two products in the cart" do
    @cart.add(@line_item)

    product = ShoppingCart::Product.new(2, "pants", 200)
    line_item = ShoppingCart::LineItem.new(product, 1)
    @cart.add(line_item)

    expect(@cart.total_items).to eq(2)
    expect(@cart.total_sum).to eq(500)
  end

  it "should display price of two if the quantity has two" do
    line_item = ShoppingCart::LineItem.new(@product, 2)
    @cart.add(line_item)

    expect(@cart.total_sum).to eq(600)
  end

  it "should remove a product from cart" do
    @cart.add(@line_item)

    product = ShoppingCart::Product.new(2, "pants", 200)
    line_item = ShoppingCart::LineItem.new(product, 1)
    @cart.add(line_item)

    @cart.remove(2)

    expect(@cart.total_sum).to eq(300)
  end

  it "should increase the amount of product" do
    @cart.add(@line_item)
    @cart.increase_quanitity("jacket")

    expect(@cart.total_sum).to eq(600)

    @cart.increase_quanitity("jacket")
    expect(@cart.total_sum).to eq(900)

    @cart.items.each do |list_item|
      expect(list_item.quanitity).to eq(3)
    end
  end

  it "should decrease the amount of product" do
    @cart.add(@line_item)

    product = ShoppingCart::Product.new(2, "pants", 200)
    line_item = ShoppingCart::LineItem.new(product, 1)
    @cart.add(line_item)

    expect(@cart.total_items).to eq(2)

    @cart.decrease_quanitity("jacket")

    expect(@cart.total_items).to eq(1)

    expect(@cart.total_sum).to eq(200)
    expect(@cart.total_items).to eq(1)
  end

  it "should get the cheapeast item for free when buying 3 product" do
    @cart.add(@line_item)

    product = ShoppingCart::Product.new(2, "pants", 200)
    line_item = ShoppingCart::LineItem.new(product, 1)
    @cart.add(line_item)

    product = ShoppingCart::Product.new(3, "apple", 50)
    line_item = ShoppingCart::LineItem.new(product, 1)
    @cart.add(line_item)

    expect(@cart.total_items).to eq(3)

    # should get the chepeast item for free
    expect(@cart.total_sum).to eq(500)
  end

  it "should show your order" do
    @cart.add(@line_item)

    product = ShoppingCart::Product.new(2, "pants", 200)
    line_item = ShoppingCart::LineItem.new(product, 1)
    @cart.add(line_item)

    expect(@cart.your_order).to eq("Your order: $500 items: jacket, pants")
  end

  it "should reset the item cart after making order" do
    @cart.add(@line_item)

    product = ShoppingCart::Product.new(2, "pants", 200)
    line_item = ShoppingCart::LineItem.new(product, 1)
    @cart.add(line_item)

    # should show thanks message
    expect(@cart.purchase()).to eq("Thanks for your order")

    # should reset the item cart
    expect(@cart.items.empty?).to eq(true)
  end
end
