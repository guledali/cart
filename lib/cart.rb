class Cart
  attr_accessor :items

  def initialize()
    @items = []
  end

  def add(line_item)
    @items.push(line_item)
  end

  def remove(id)
    list_item = nil

    @items.each do |item|
      if item.product.id == id
        list_item = item
      end
    end
    @items.delete(list_item)
    return @items
  end

  def increase_quanitity(product_name)
    list_item = nil
    @items.each do |item|
      if item.product.name == product_name
        list_item = item
      end
    end
    list_item.increase
  end

  def decrease_quanitity(product_name)
    list_item = nil
    @items.each do |item|
      if item.product.name == product_name
        list_item = item
      end
    end
    list_item.decrease

    if (list_item.quanitity == 0)
      items.delete(list_item)
    end
  end

  def total_sum
    products_in_cart = []
    items_discount = []
    # todo join products_in_cart in newline
    sum = 0
    lineitem = nil
    @items.each do |item|
      sum = sum + (item.product.price * item.quanitity)
      products_in_cart << item.product
    end

    if (@items.size > 2)
      @items.each do |line_item|
        items_discount << line_item.product.price
      end
      sum = sum - items_discount.min()
    end
    return sum
  end

  def total_items
    return @items.size
  end

  def your_order
    order_list = []
    items.each do |item|
      order_list << item.product.name
    end

    "Your order: $#{total_sum} items: #{order_list.join(", ")}"
  end

  def purchase
    @items = []
    return "Thanks for your order"
  end
end
