A simple shopping-cart written in ruby with TDD in mind, in order to run the application make sure you got ruby installed and RSpec. Please consult RSpec installation for further information [How to install RSpec](https://relishapp.com/rspec/docs/gettingstarted)

The Cart class serves as base class for the following tasks,

- [X] Should add and remove items from the cart
- [X] Should print what's in the cart and the total cost
- [X] Should apply a discount of getting the cheapest item for free when buying 3 or more items
- [X] Should make a purshase


1. cd into lib folder and then cd into shopping_cart folder
2. Start the irb session by typing irb and require shopping_cart module by paste the following code snippet

```ruby
require_relative("shopping_cart.rb") #  ← comment this line
 => true
irb(main):002:0>
```

3. Initialise the shopping_cart class 

```ruby
   cart = ShoppingCart.call(id: 1, name: "jacket", price: 200) # note that these arguments are required!
```

4. Creating new product and line_item

```ruby
   require_relative("product.rb")
   require_relative("line_item.rb")
   ## create new product
   ## create new line_item
   product = ShoppingCart::Product.new(2, "pants", 200)
   line_item = ShoppingCart::LineItem.new(product, 1)

   cart.add(line_item)
```

Please check the spec file `cart_spec.rb` for all available methods
