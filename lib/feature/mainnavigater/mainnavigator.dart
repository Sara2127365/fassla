import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/cart/cart_screen.dart';
import 'package:task1fassla/feature/explor/explore_screen.dart';
import 'package:task1fassla/feature/home/home_screen.dart';
import 'package:task1fassla/feature/profile/profile_screen.dart';

class HomeBottomNavigation extends StatelessWidget {
  final int selectedIndex;

  const HomeBottomNavigation({
    super.key,
    this.selectedIndex = 0,
  });

  void _navigateToScreen(BuildContext context, int index) {
    final screens = [
      const HomeScreen(),
      const ExploreScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: ColorManager.borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            title: 'Home',
            isSelected: selectedIndex == 0,
            onTap: () => _navigateToScreen(context, 0),
          ),
          _NavItem(
            icon: Icons.search,
            title: 'Explore',
            isSelected: selectedIndex == 1,
            onTap: () => _navigateToScreen(context, 1),
          ),
          _NavItem(
            icon: Icons.shopping_cart_outlined,
            title: 'Cart',
            isSelected: selectedIndex == 2,
            onTap: () => _navigateToScreen(context, 2),
          ),
          _NavItem(
            icon: Icons.person_outline,
            title: 'Profile',
            isSelected: selectedIndex == 3,
            onTap: () => _navigateToScreen(context, 3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: isSelected
                ? ColorManager.primaryColor
                : ColorManager.greyColor,
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: isSelected
                  ? ColorManager.primaryColor
                  : ColorManager.greyColor,
              fontWeight:
                  isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}