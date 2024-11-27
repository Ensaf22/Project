import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Text('Displaying items for $categoryName'),
      ),
    );
  }
}