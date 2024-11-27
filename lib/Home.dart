import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Cake.dart';
import 'package:untitled1/Cart.dart';
import 'package:untitled1/Desert.dart';
import 'package:untitled1/Order.dart';
import 'package:untitled1/UserProvider.dart';
import 'package:untitled1/drinks.dart';
import 'package:untitled1/fastfood.dart';
import 'package:untitled1/pizza.dart';
import 'package:untitled1/salad.dart';
import 'CartProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final username = 'User'; // This can be dynamically set from a login or account page

    return Scaffold(
      appBar: AppBar(
          title: const Text("             Food Delivery",
            style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,

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
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ClipOval(
                    child: Image.asset(
                      "images/person.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Consumer<UserProvider>(
                    builder: (context, userProvider, child) {
                      return Text(
                        ' ${userProvider.username.isNotEmpty ? userProvider.username : 'Guest'}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.fastfood, color: Colors.orange),
              title: const Text('Fast Food'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FastfoodPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.cake, color: Colors.brown),
              title: const Text('Sweets'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SweetPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_drink, color: Colors.blue),
              title: const Text('Drinks'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrinksPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_pizza, color: Colors.red),
              title: const Text('Pizza'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PizzaPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const Text('Settings'),

            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search for food...",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Special Offers & Discounts',textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red, decoration: TextDecoration.lineThrough,decorationColor: Colors.red),
            ),
          ),
          SizedBox(height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildOfferCard("images/offers1.jpg"),
                _buildOfferCard("images/offers2.jpg"),
                _buildOfferCard("images/offers3.jpg"),
              ],
            ),),SizedBox(height: 22,),

          Container( width: double.infinity,
            color: Colors.orangeAccent,
            padding: EdgeInsets.symmetric(vertical: 11),
            child: Text(
              'Categories Food',textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),
            ),

          ),SizedBox(height: 10,),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 11,
              mainAxisSpacing: 16,
              padding: const EdgeInsets.all(16),
              children: [
                _buildCategoryCard(context, 'Fast Food', "images/fastfood.JPG", FastfoodPage()),
                _buildCategoryCard(context, 'Pizza', "images/pizza.jpg", PizzaPage(),),
                _buildCategoryCard(context, 'Cakes', "images/cake.JPG", CakePage()),
                _buildCategoryCard(context, 'Drinks', "images/drink.JPG", DrinksPage()),
                _buildCategoryCard(context, 'Salads', "images/salad.jpg", SaladPage()),
                _buildCategoryCard(context, 'Sweets', "images/sweet.JPG", SweetPage()),

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: 'Orders'),
        ],
        currentIndex: 0,
        onTap: (index) {
          if(index==2){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          }
          else if(index==3){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => OrdersPage()),
            );
          }
          else{
          }
          // Handle bottom navigation tap
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  Widget _buildOfferCard(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: 300,
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, String image, Widget destinationPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  }