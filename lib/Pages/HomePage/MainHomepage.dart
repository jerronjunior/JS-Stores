import 'package:flutter/material.dart';
import './Category/Category.dart';
// import './AddToCart/cart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './Products/dairy.dart';
import './Products/pantry.dart';
import './Products/vegetables.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    CategoryPage(),
    // CartPage(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.lightBlue, // Set your desired background color here
        child: Column(
          children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 5, bottom: 0),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
            ],
          ),
          child: const Text(
            'JS STORES',
            textAlign: TextAlign.center,
            style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 31, 16, 170),
          letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.shopping_cart),
          //   label: 'Cart',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        backgroundColor: const Color.fromARGB(255, 134, 164, 218),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<String> bannerImages = [
    'assets/Images/HomePage/week.jpg',
    'assets/Images/HomePage/delivery.jpg',
    'assets/Images/HomePage/rf.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          // Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: 'Search products...',
          //       prefixIcon: Icon(Icons.search),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(25.0),
          //       ),
          //       filled: true,
          //       fillColor: Colors.grey[200],
          //     ),
          //   ),
          // ),

          // Banner Carousel
                    
          
    
          // Categories Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PantryPage()),
                        );
                      },
                      child: _buildCategoryCard('Pantry', Icons.kitchen),
                      ),
                      GestureDetector(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VegetablesPage()),
                        );
                      },
                      child: _buildCategoryCard('Vegetables', Icons.eco),
                      ),
                      GestureDetector(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DairyPage()),
                        );
                      },
                      child: _buildCategoryCard('Dairy', Icons.egg),
                      ),
                    ],
                    ),
                ),
              ],
            ),
          ),

          // Special Offers
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Special Offers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                    children: [
                    _buildProductCard('Frozen', '3.99', '3.99', '25% OFF', 'assets/Images/frozen.jpg'),
                    _buildProductCard('Snacks', '1.99', '2.49', '20% OFF', 'assets/Images/snacks_beverages.jpg'),
                    _buildProductCard('Bakery items', '4.99', '5.99', '15% OFF', 'assets/Images/bakery.jpg'),
                    _buildProductCard('fruits & vegetables', '6.99', '8.99', '30% OFF', 'assets/Images/fruits_vegetables.jpg'),
                    ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 30, color: Colors.blueAccent),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

    Widget _buildProductCard(String name, String price, String oldPrice, String discount, String imagePath) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
                const SizedBox(width: 5),
                Text(
                  '\$$oldPrice',
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}