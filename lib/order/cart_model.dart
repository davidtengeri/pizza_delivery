import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:pizza_delivery/order/pizza.dart';

class CartModel with ChangeNotifier {
  // Store the cart items
  List<Pizza> _items = [];

  // Gives the list of items which is unmodifiable from outside
  UnmodifiableListView<Pizza> get items => UnmodifiableListView(_items);

  // Gets the total price of the cart
  double get total => _items.fold(0, (amount, pizza) => pizza.price + amount);

  // Adds a new pizza to the cart
  void add(Pizza pizza) {
    _items.add(pizza);
    notifyListeners();
  }
}
