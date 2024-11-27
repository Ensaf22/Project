import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/CartItem.dart';
import 'CartProvider.dart';

class CakePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final List<Map<String, dynamic>> CakeProducts = [
      {'name': 'Strawberry cake', 'price': 10.0, 'image': "images/K1.JPEG"},
      {'name': 'Chocolate cake', 'price': 12.0, 'image': "images/K2.JPEG"},
      {'name': 'Strawberry cake', 'price': 15.0, 'image': "images/K3.JPEG"},
      {'name': 'Caramel cake', 'price': 10.0, 'image': "images/K4.JPEG"},
      {'name': 'cherry cake', 'price': 15.0, 'image': "images/K5.JPEG"},
      {'name': 'vanilla cake', 'price': 11.0, 'image': "images/K6.JPEG"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CAKES",
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
        itemCount: CakeProducts.length,
        itemBuilder: (context, index) {
          final product = CakeProducts[index];
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
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
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