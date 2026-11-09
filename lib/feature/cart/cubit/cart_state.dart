import 'package:task1fassla/feature/cart/models/cart_item.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;

  CartLoaded({required this.items});

  double get subtotal {
    return items.fold(
      0.0,
      (sum, item) => sum + item.totalPrice,
    );
  }

  int get totalItems {
    return items.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }

  bool get isEmpty => items.isEmpty;
}

class CartSuccess extends CartState {
  final String message;

  CartSuccess(this.message);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}