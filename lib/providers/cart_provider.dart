import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts_2022110006/models/product.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Product product) {
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
    _saveToPrefs();
  }

  void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
    _saveToPrefs();
  }

  void updateQuantity(int productId, int quantity) {
    int index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index].quantity = quantity;
      if (quantity <= 0) {
        _items.removeAt(index);
      }
      notifyListeners();
      _saveToPrefs();
    }
  }

  Future<void> loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    String? cartJson = prefs.getString('cart');
    if (cartJson != null) {
      List<dynamic> decodedList = jsonDecode(cartJson);
      _items = decodedList.map((item) => CartItem(
        product: Product(
          id: item['product']['id'],
          title: item['product']['title'],
          price: item['product']['price'].toDouble(),
          image: item['product']['image'],
        ),
        quantity: item['quantity'],
      )).toList();
      notifyListeners();
    }
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String cartJson = jsonEncode(_items.map((item) => {
      'product': {
        'id': item.product.id,
        'title': item.product.title,
        'price': item.product.price,
        'image': item.product.image,
      },
      'quantity': item.quantity,
    }).toList());
    prefs.setString('cart', cartJson);
  }
}