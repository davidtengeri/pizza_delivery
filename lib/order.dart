import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizza_delivery/cart_button.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:pizza_delivery/order/pizza.dart';
import 'package:pizza_delivery/pizza_card.dart';
import 'package:provider/provider.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Order a pizza'),
        actions: <Widget>[CartButton()],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: pizzaList.map((pizza) => PizzaCard(pizza: pizza)).toList(),
        ),
      ),
    ));
  }
}
