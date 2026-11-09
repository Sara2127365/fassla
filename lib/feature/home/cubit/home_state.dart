import 'package:task1fassla/feature/home/models/home_product.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> categories;
  final String selectedCategory;
  final List<HomeProduct> products;
  final List<HomeProduct> filteredProducts;
  final String searchQuery;

  HomeLoaded({
    required this.categories,
    required this.selectedCategory,
    required this.products,
    required this.filteredProducts,
    required this.searchQuery,
  });

  HomeLoaded copyWith({
    String? selectedCategory,
    List<HomeProduct>? filteredProducts,
    String? searchQuery,
  }) {
    return HomeLoaded(
      categories: categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      products: products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}