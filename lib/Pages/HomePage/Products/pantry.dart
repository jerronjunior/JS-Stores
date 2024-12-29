import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/pantry_provider.dart';
import '../../../providers/cart_providers.dart';
import '../AddToCart/cart.dart';

class PantryPage extends StatelessWidget {
  const PantryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Pantry Staples'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      
    
      body: Container(
        color: Colors.lightBlue, // Set your desired background color here
        child: Consumer<PantryProvider>(
          builder: (context, pantryProvider, child) {
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: pantryProvider.items.length,
          itemBuilder: (context, index) {
            final item = pantryProvider.items[index];
            return Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
            child: Stack(
              children: [
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
                ),
                Positioned(
              bottom: 8,
              right: 8,
              child: FloatingActionButton.small(
                onPressed: () {
                  final cartProvider = Provider.of<CartProvider>(
                context,
                listen: false,
                  );
                  cartProvider.addItem(
                item.name,
                item.name,
                item.price,
                item.imageUrl,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.name} added to cart'),
                  duration: const Duration(seconds: 1),
                ),
                  );
                },
                child: const Icon(Icons.add),
              ),
                ),
              ],
            ),
              ),
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              item.name,
              style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
              ),
            ],
          ),
            );
          },
        );
          },
        ),
      ),
    );
  }
}