module ShoppingCart
  class LineItem
    attr_reader :product
    attr_accessor :quanitity

    def initialize(product, quanitity)
      @product = product
      @quanitity = quanitity
    end

    def increase
      self.quanitity = quanitity + 1
      return @quanitity
    end

    def decrease
      self.quanitity = quanitity - 1
      return @quanitity
    end

    def quanitity_zero?
      return quanitity == 0
    end
  end
end
