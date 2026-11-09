
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task1fassla/feature/home/cubit/home_state.dart';
import 'package:task1fassla/feature/home/models/home_product.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    loadHomeData();
  }

  final List<String> categories = [
    'All',
    'Tech',
    'Fashion',
    'Home',
  ];

  final List<HomeProduct> products = const [
    HomeProduct(
      name: 'Wireless Headphones',
      price: '\$89.00',
      rating: '4.8',
      imagePath: 'assets/images/head_phones.png',
      category: 'Tech',
    ),
    HomeProduct(
      name: 'Smart Watch',
      price: '\$129.00',
      rating: '4.9',
      imagePath: 'assets/images/watch.png',
      category: 'Tech',
    ),
    HomeProduct(
      name: 'IPhone 17',
      price: '\$699.00',
      rating: '4.7',
      imagePath: 'assets/images/iphone.png',
      category: 'Tech',
    ),
  ];

  void loadHomeData() {
    emit(
      HomeLoaded(
        categories: categories,
        selectedCategory: 'All',
        products: products,
        filteredProducts: products,
        searchQuery: '',
      ),
    );
  }

  void selectCategory(String category) {
    if (state is! HomeLoaded) return;

    final currentState = state as HomeLoaded;

    final filtered = _filterProducts(
      category: category,
      query: currentState.searchQuery,
    );

    emit(
      currentState.copyWith(
        selectedCategory: category,
        filteredProducts: filtered,
      ),
    );
  }

  void searchProducts(String query) {
    if (state is! HomeLoaded) return;

    final currentState = state as HomeLoaded;

    final filtered = _filterProducts(
      category: currentState.selectedCategory,
      query: query,
    );

    emit(
      currentState.copyWith(
        searchQuery: query,
        filteredProducts: filtered,
      ),
    );
  }

  List<HomeProduct> _filterProducts({
    required String category,
    required String query,
  }) {
    return products.where((product) {
      final matchesCategory =
          category == 'All' || product.category == category;

      final matchesSearch = product.name
          .toLowerCase()
          .contains(query.trim().toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();
  }
}
