require_relative("./cart/cart.rb")
require_relative("./cart/product.rb")
require_relative("./cart/line_item.rb")

module ShoppingCart
  class << self

    # @param id [Integer] Record id
    # @param name [String] Product name
    # @param price [Integer] Product price
    def call(id:, name:, price:)
      cart = Cart::Cart.new()
      product = Cart::Product.new(id, name, price)
      line_item = Cart::LineItem.new(product, 1)
      cart.add(line_item)
      return cart
    end
  end
end
