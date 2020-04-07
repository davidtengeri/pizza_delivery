import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:pizza_delivery/order/pizza.dart';

class FavouritesModel with ChangeNotifier {
  // Store the cart items
  Set<Pizza> _items = HashSet();

  // Gives the list of items which is unmodifiable from outside
  UnmodifiableListView<Pizza> get items => UnmodifiableListView(_items);

  // Adds a new pizza to the cart
  void add(Pizza pizza) {
    _items.add(pizza);
    notifyListeners();
  }

  void remove(Pizza pizza) {
    _items.remove(pizza);
    notifyListeners();
  }

  bool isFavourite(Pizza pizza) => _items.contains(pizza);
}
