import 'package:flutter/foundation.dart' as flutter;
import '../models/category_model.dart';

class CategoryProvider with flutter.ChangeNotifier {
  final List<Category> _categories = [
    Category(
      title: 'Pantry Staples',
       image: 'assets/images/pantry_staples.jpg', caption: '',
    ),
    Category(
      title: 'Fresh Produce',
      caption: '',image: 'assets/images/fruits_vegetables.jpg'
    ),
    Category(
      title: 'Dairy and Eggs',
      caption: '',  image: 'assets/images/dairy_eggs.jpg'
    ),
  ];

  List<Category> get categories => [..._categories];
}