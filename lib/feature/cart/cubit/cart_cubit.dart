
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1fassla/feature/cart/cubit/cart_state.dart';
import 'package:task1fassla/feature/cart/models/cart_item.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static const String _cartKey = 'cart_items';

  List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  // Load cart products
  Future<void> loadCart() async {
    emit(CartLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = prefs.getString(_cartKey);

      if (cartData != null && cartData.isNotEmpty) {
        final List<dynamic> decodedData = jsonDecode(cartData);

        _items = decodedData.map((item) {
          return CartItem.fromJson(
            Map<String, dynamic>.from(item),
          );
        }).toList();
      } else {
        _items = [];
      }

      _emitLoaded();
    } catch (e) {
      emit(CartError('Failed to load cart: $e'));
    }
  }

  // Add product to cart
  Future<void> addItem(CartItem item) async {
    try {
      final index = _items.indexWhere(
        (element) => element.name == item.name,
      );

      if (index != -1) {
        _items[index].quantity =
            (_items[index].quantity + item.quantity).clamp(1, 100);
      } else {
        _items.add(item);
      }

      await _saveCart();
      _emitLoaded();
    } catch (e) {
      emit(CartError('Failed to add product: $e'));
    }
  }

  // Increase quantity
  Future<void> increment(int index) async {
    if (index < 0 || index >= _items.length) return;

    if (_items[index].quantity < 100) {
      _items[index].quantity++;
      await _updateCart();
    }
  }

  // Decrease quantity or remove product
  Future<void> decrement(int index) async {
    if (index < 0 || index >= _items.length) return;

    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
    }

    await _updateCart();
  }

  // Remove product
  Future<void> removeItem(int index) async {
    if (index < 0 || index >= _items.length) return;

    _items.removeAt(index);
    await _updateCart();
  }

  // Clear cart
  Future<void> clearCart() async {
    try {
      _items.clear();

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_cartKey);

      _emitLoaded();
    } catch (e) {
      emit(CartError('Failed to clear cart: $e'));
    }
  }

  // Save cart
  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();

    final encodedData = jsonEncode(
      _items.map((item) => item.toJson()).toList(),
    );

    await prefs.setString(_cartKey, encodedData);
  }

  // Update cart
  Future<void> _updateCart() async {
    try {
      await _saveCart();
      _emitLoaded();
    } catch (e) {
      emit(CartError('Failed to update cart: $e'));
    }
  }

  // Emit loaded state
  void _emitLoaded() {
    emit(
      CartLoaded(
        items: List.unmodifiable(_items),
      ),
    );
  }
}
