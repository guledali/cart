module ShoppingCart
  class Cart
    attr_accessor :items, :list_item

    def initialize()
      @items = []
      @list_item = nil
    end

    def add(line_item)
      items.push(line_item)
    end

    def remove(id)
      items.each do |item|
        list_item = set_list_item(item, id)
      end

      delete_list_item(list_item)
    end

    def increase_quanitity(product_name)
      items.each do |item|
        list_item = set_list_item(item, product_name)
      end
      list_item.increase
    end

    def decrease_quanitity(product_name)
      items.each do |item|
        set_list_item(item, product_name)
      end
      list_item.decrease

      if (list_item.quanitity_zero?)
        delete_list_item(list_item)
      end
    end

    def total_sum
      products_in_cart = []
      items_discount = []
      sum = 0

      items.each do |item|
        sum = sum + (item.product.price * item.quanitity)
        products_in_cart << item.product
      end

      if (items.size > 2)
        items.each do |line_item|
          items_discount << line_item.product.price
        end
        sum = sum - items_discount.min()
      end
      return sum
    end

    def total_items
      return items.size
    end

    def your_order
      order_list = []
      items.each do |item|
        order_list << item.product.name
      end

      "Your order: $#{total_sum} items: #{order_list.join(", ")}"
    end

    def purchase
      self.items = []
      return "Thanks for your order"
    end

    private

    def delete_list_item(list_item)
      items.delete(list_item)
      return items
    end

    def set_list_item(item, field)
      if (item.product.id == field || item.product.name == field)
        self.list_item = item
      end
    end
  end
end
