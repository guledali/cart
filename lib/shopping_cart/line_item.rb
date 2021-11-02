module ShoppingCart
  class LineItem
    attr_reader :product, :quanitity

    def initialize(product, quanitity)
      @product = product
      @quanitity = quanitity
    end

    def increase
      @quanitity = quanitity + 1
      return @quanitity
    end

    def decrease
      @quanitity = quanitity - 1
      return @quanitity
    end

    def quanitity_zero?
      return quanitity == 0
    end
  end
end
