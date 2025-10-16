enum OrderType { pickup, delivery }

class Shop {
  final String shopName;
  final String shopAddress;

  Shop({required this.shopAddress, required this.shopName});
}

class Product {
  final String productName;
  final double productPrice;

  Product({required this.productName, required this.productPrice});
}

class Customer {
  final String customerName;
  final String? customerEmail;
  final String? address;

  Customer({this.customerEmail, required this.customerName, this.address});
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({required this.product, required this.quantity});

  double totalPerItem() => product.productPrice * quantity;
}

class Order {
  final Customer customer;
  final OrderType type;
  final List<OrderItem> items;
  final Shop? shop;
  final String? address; //optional address (office, friend's home)

  Order({
    required this.customer,
    required this.type,
    required this.items,
    this.shop,
    this.address,
  });

  double totalAmount() {
    double totalAmount = 0;
    for (var item in items) {
      totalAmount += item.totalPerItem();
    }
    return totalAmount;
  }

  @override
  String toString() {
    String deliveryInfo;
    if (type == OrderType.delivery) {
      deliveryInfo = 'Delivered to: ${address ?? customer.address ?? 'N/A'}';
    } else {
      if (shop == null) {
        deliveryInfo = 'Pick up at: N/A';
      } else {
        deliveryInfo =
            'Product to be picked up at: ${shop!.shopName}, ${shop!.shopAddress}';
      }
    }
    return '''
    Customer: ${customer.customerName}
    Order type: ${type.name}
    $deliveryInfo
    Total: \$${totalAmount().toStringAsFixed(2)}
    ''';
  }
}

void main() {
  var shop = Shop(shopName: 'Bro mav', shopAddress: 'Prek Leab');
  var coffee = Product(productName: 'Latte', productPrice: 1.5);
  var customer = Customer(customerName: 'Rafat', address: 'CADT');

  var deliveryOrder = Order(
    customer: customer,
    type: OrderType.delivery,
    items: [OrderItem(product: coffee, quantity: 2)],
    shop: shop
  );

  var pickupOrder = Order(
    customer: customer,
    type: OrderType.pickup,
    items: [OrderItem(product: coffee, quantity: 2)],
    shop: shop,
  );

  print('--- Delivery Order ---');
  print(deliveryOrder);
  print('\n--- Pickup Order ---');
  print(pickupOrder);
}
