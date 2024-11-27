import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/CartItem.dart';
import 'CartProvider.dart';

class SweetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final List<Map<String, dynamic>> SweetProducts = [
      {'name': 'Cookies', 'price': 5.0, 'image': "images/w1.JPEG"},
      {'name': 'Cheesecake', 'price': 7.0, 'image': "images/w2.JPEG"},
      {'name': 'Pancake', 'price': 10.0, 'image': "images/w3.JPEG"},
      {'name': 'Dount Box', 'price': 20.0, 'image': "images/w4.JPEG"},
      {'name': 'Macron', 'price': 6.0, 'image': "images/w5.JPEG"},
      {'name': 'One Dount', 'price': 4.0, 'image': "images/w6.JPEG"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SWEETS",
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
        itemCount: SweetProducts.length,
        itemBuilder: (context, index) {
          final product = SweetProducts[index];
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
                            backgroundColor:Colors.orange,
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