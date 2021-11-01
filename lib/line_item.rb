class LineItem
  def initialize(product, quanitity)
    @product = product
    @quanitity = quanitity
  end

  def quanitity
    @quanitity
  end

  def product
    return @product
  end

  def increase
    @quanitity = quanitity + 1
    return @quanitity
  end

  def decrease
    @quanitity = quanitity - 1
    return @quanitity
  end
end
