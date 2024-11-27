import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'OrderProvider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 8,
              color: Colors.grey,
            ),
          ],
        ),),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: orderProvider.orders.isEmpty
          ? const Center(
        child: Text(
          "No orders yet",
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: orderProvider.orders.length,
        itemBuilder: (context, index) {
          final order = orderProvider.orders[index];
          final orderItems = List<Map<String, dynamic>>.from(order['items']);
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              title: Text(
                "Order #${order['id'].substring(0, 8)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Total: \$${order['totalPrice'].toStringAsFixed(2)}",
              ),
              children: [
                ...orderItems.map((item) {
                  return ListTile(
                    leading: Image.asset(
                      item['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item['name']),
                    subtitle: Text("Quantity: ${item['quantity']}"),
                    trailing: Text(
                      "\$${(item['price'] * item['quantity']).toStringAsFixed(2)}",
                    ),
                  );
                }).toList(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Order Time: ${order['orderTime']}",
                    style: const TextStyle(color: Colors.grey),
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