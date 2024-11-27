import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/CartItem.dart';
import 'CartProvider.dart';

class SaladPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final List<Map<String, dynamic>> SaladProducts = [
      {'name': 'egg salad', 'price': 10.0, 'image': "images/S1.JPEG"},
      {'name': 'Cheese salad', 'price': 12.0, 'image': "images/S2.JPEG"},
      {'name': 'Tomato salad', 'price': 15.0, 'image': "images/S3.JPEG"},
      {'name': 'Green salad', 'price': 11.0, 'image': "images/S4.JPEG"},
      {'name': 'Cabbage salad', 'price': 14.0, 'image': "images/S5.JPEG"},
      {'name': 'Oatmeal milk', 'price': 18.0, 'image': "images/S6.JPEG"},

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SALADS",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 8,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 16, // المسافة الأفقية بين الأعمدة
          mainAxisSpacing: 16, // المسافة الرأسية بين الصفوف
          childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع لتكبير الصور
        ),
        padding: const EdgeInsets.all(16),
        itemCount: SaladProducts.length,
        itemBuilder: (context, index) {
          final product = SaladProducts[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.cover, // التأكد من أن الصورة تغطي كامل المساحة
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "\$${product['price'].toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cartProvider.addItem(CartItem(
                              name: product['name'],
                              price: product['price'],
                              image: product['image'],
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${product['name']} added to cart"),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}