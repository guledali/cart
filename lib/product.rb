class Product
  attr_accessor :id, :name, :price

  def initialize(id, name, price)
    @id = id
    @name = name
    @price = price
  end

  # def find(name)
  #   if @products.empty?
  #     raise StandardError.new "Our products are empty at momment"
  #   end

  #   product = @products.find { |x| x["name"] == name }
  #   @product.push(product.transform_keys(&:to_sym))
  #   return @product
  # end
end
