import 'package:flutter/material.dart';
import 'package:pizza_delivery/menu_item.dart';

class Answer extends StatelessWidget {
  final MenuItem item;

  Answer({this.item});

  String get text {
    switch (item) {
      case MenuItem.order:
        return 'I want to order a pizza';
      case MenuItem.favourites:
        return 'I want to see my favourite pizzas';
      case MenuItem.profile:
        return 'I want to check my profile';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
