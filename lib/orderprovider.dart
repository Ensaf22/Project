import 'package:flutter/material.dart';
import 'CartItem.dart';

class OrderProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _orders = [];

  List<Map<String, dynamic>> get orders => _orders;

  void addOrder(List<CartItem> cartItems, double totalPrice) {
    if (cartItems.isNotEmpty) {
      _orders.add({
        'id': DateTime.now().toIso8601String(), // استخدام قيمة فريدة لكل طلب.
        'items': cartItems.map((item) =>{
          'name': item.name,
          'price': item.price,
          'image': item.image,
          'quantity':1,}).toList(),
        'totalPrice': totalPrice, // يجب أن تكون double.
        'orderTime': DateTime.now().toString(), // وقت الطلب كنص.
      });
      notifyListeners();
    }
  }
}
