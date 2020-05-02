import 'package:flutter/material.dart';
import 'package:pizza_delivery/order/pizza.dart';
import 'package:pizza_delivery/pizza/topping_image.dart';

class PizzaToppings extends StatelessWidget {
  final Pizza pizza;

  const PizzaToppings({
    Key key,
    @required this.pizza,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: pizza.toppings
          .map(
            (topping) => ToppingImage(
              topping: topping,
            ),
          )
          .toList(),
    );
  }
}
