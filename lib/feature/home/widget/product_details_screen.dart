
import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String name;
  final String price;
  final String rating;
  final String imageUrl;

  const ProductDetailsScreen({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: ColorManager.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: ColorManager.textColor,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_outlined,
                    size: 80,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            Text(
              name,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: ColorManager.textColor,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primaryColor,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: Color(0xFFFFA726),
                ),
                const SizedBox(width: 5),
                Text(
                  rating,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorManager.textColor,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enjoy this product with its great quality and modern design. '
              'A perfect choice for your everyday needs.',
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: ColorManager.greyColor,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'Product added to cart successfully!',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: ColorManager.green,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ),
  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
