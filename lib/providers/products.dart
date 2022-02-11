import 'package:flutter/foundation.dart';

import './product.dart';

class Products with ChangeNotifier {
  // ignore: unused_field
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Cargo Catapult',
      description: 'Aim kilometers away and send your cargo!',
      price: 84000,
      imageUrl: 'https://static1.thegamerimages.com/wordpress/wp-content/uploads/2021/09/death_stranding_cargo_catapult_lauching_cargo_boxes.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Delivery Bot',
      description: 'A bot to walk the for you.',
      price: 30000,
      imageUrl:
          'https://static1.thegamerimages.com/wordpress/wp-content/uploads/2021/09/death_stranding_delivery_bot_carrying_cargo.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Truck',
      description: 'Truck that can go through any obstacle.',
      price: 40000,
      imageUrl: 'https://static1.thegamerimages.com/wordpress/wp-content/uploads/2020/03/deathstranding_truck-Cropped.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Generator',
      description: 'Charge batteries and extend your journey.',
      price: 20000,
      imageUrl: 'https://static1.thegamerimages.com/wordpress/wp-content/uploads/2020/03/deathstranding_generator-Cropped.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Reverse Trike',
      description: 'Ride the mountains!',
      price: 25000,
      imageUrl: 'https://static1.thegamerimages.com/wordpress/wp-content/uploads/2021/09/death_stranding_reverse_trike_traveling_the_terrain.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Backpack',
      description: 'Put your cargo on this amazing backpack.',
      price: 8000,
      imageUrl: 'https://cdn.holdtoreset.com/wp-content/uploads/2019/11/09105418/how-to-customize-your-backpack.jpg',
    )
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
            title: product.title,
            description: product.description,
            price: product.price,
            imageUrl: product.imageUrl,
            id: DateTime.now().toString()
        );
    _items.insert(0, newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if(prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

}
