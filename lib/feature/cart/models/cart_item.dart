
class CartItem {
  final String name;
  final String price;
  final String imagePath;

  int _quantity;

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value.clamp(0, 100);
  }

  CartItem({
    required this.name,
    required this.price,
    required this.imagePath,
    int quantity =1,
  }) : _quantity = quantity.clamp(0, 100);

  double get numericPrice {
    return double.tryParse(
          price.replaceAll(RegExp(r'[^0-9.]'), ''),
        ) ??
        0.0;
  }

  double get totalPrice => numericPrice * quantity;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imagePath': imagePath,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name']?.toString() ?? '',
      price: json['price']?.toString() ?? '0',
      imagePath: json['imagePath']?.toString() ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );
  }
}
