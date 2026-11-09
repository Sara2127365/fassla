import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/core/widgets/app_custom_bar.dart';
import 'package:task1fassla/feature/home/widget/home_categories.dart';
import 'package:task1fassla/feature/home/widget/home_searchbar.dart';
import 'package:task1fassla/feature/home/widget/popular_product_section.dart';
import 'package:task1fassla/feature/mainnavigater/mainnavigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,

      appBar: AppCustomBar(
        title: 'Discover',
        showBackButton: false,
        action: Icon(Icons.shopping_cart,),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Find something you'll love",
                style: TextStyle(
                  fontSize: 12,
                  color: ColorManager.greyColor,
                ),
              ),
              SizedBox(height: 16),

              HomeSearchBar(),
              SizedBox(height: 18),

              HomeCategories(),
              SizedBox(height: 18),

              PopularProductsSection(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const HomeBottomNavigation(),
    );
  }
}