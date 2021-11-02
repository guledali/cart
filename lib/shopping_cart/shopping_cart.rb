require_relative("./cart.rb")
require_relative("./product.rb")
require_relative("./line_item.rb")

module ShoppingCart
  class << self
    def call(id:, name:, price:)
      cart = ShoppingCart::Cart.new()
      product = ShoppingCart::Product.new(id, name, price)
      line_item = ShoppingCart::LineItem.new(product, 1)
      cart.add(line_item)
      return cart
    end
  end
end
