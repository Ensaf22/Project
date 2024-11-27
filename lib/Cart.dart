import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Order.dart';
import 'CartProvider.dart';
import 'OrderProvider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
        appBar: AppBar(
        title: const Text("Cart", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 8,
              color: Colors.grey,
            ),
          ],
        ),),
    leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white,),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
          backgroundColor: Colors.orange,
    ),
    body: cartProvider.cartItems.isEmpty
        ? const Center(child: Text("No items in the cart"))
        : ListView.builder(
      itemCount: cartProvider.cartItems.length,
      itemBuilder: (context, index) {
        final item = cartProvider.cartItems[index];
        return ListTile(
          leading: Image.asset(item.image, width: 50, height: 50),
          title: Text(item.name),
          subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.orange,),
            onPressed: () {
              cartProvider.removeItem(item);
        },
          ),
        );
        },),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',),
              ElevatedButton(
                onPressed: () {
                  if (cartProvider.cartItems.isNotEmpty) {
                    orderProvider.addOrder(cartProvider.cartItems,cartProvider.totalPrice);
                    cartProvider.clearCart();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("order placed successfully")), );
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>OrdersPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Place Order',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}