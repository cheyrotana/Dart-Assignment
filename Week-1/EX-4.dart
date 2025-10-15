void main() {
  // Map of pizza prices
  const pizzaPrices = {'margherita': 5.5, 'pepperoni': 7.5, 'vegetarian': 6.5};

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  num total = 0;
  for (var pizza in order) {
    final price = pizzaPrices[pizza];
    if (price == null) {
      print("${pizza} pizza is not on the menu.");
      continue;
    }
    total = total + price;
  }
  print("Total: ${total}");
}
