enum OrderType { pickup, delivery }

class Address {
  final String street;
  final String city;

  Address({required this.street, required this.city});

  @override
  String toString() => "$street, $city";
}

class Shop {
  final String shopName;
  final Address address;
  final List<Product> products;

  Shop({required this.shopName, required this.address, required this.products});
}

class Product {
  final String productName;
  final double productPrice;

  Product({required this.productName, required this.productPrice});
}

class Customer {
  final String customerName;
  final String? customerEmail;
  final Address? address;
  final List<Order>? orders;

  Customer({
    this.customerEmail,
    required this.customerName,
    this.address,
    this.orders,
  });
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
  final Address? deliveryAddress;

  Order({
    required this.customer,
    required this.type,
    required this.items,
    this.shop,
    this.deliveryAddress,
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
      deliveryInfo =
          'Delivered to: ${deliveryAddress ?? customer.address ?? 'N/A'}';
    } else {
      if (shop == null) {
        deliveryInfo = 'Pick up at: N/A';
      } else {
        deliveryInfo =
            'Product to be picked up at: ${shop!.shopName}, ${shop!.address}';
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
  //products
  var coffee = Product(productName: 'Latte', productPrice: 1.5);
  var tea = Product(productName: 'Green Tea', productPrice: 1.0);

  //shop with products
  var shopAddress = Address(street: 'Preak Leab 22', city: 'Prek Leab');
  var shop = Shop(
    shopName: 'Bro mav',
    address: shopAddress,
    products: [coffee, tea],
  );

  //customer with address
  var customerAddress = Address(street: 'Campus', city: 'CADT');
  var customer = Customer(customerName: 'Rafat', address: customerAddress);

  //Delivery order
  var deliveryOrder = Order(
    customer: customer,
    type: OrderType.delivery,
    items: [OrderItem(product: coffee, quantity: 2)],
    shop: shop,
  );

  //Pickup order
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
