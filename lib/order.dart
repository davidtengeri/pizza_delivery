import 'package:flutter/material.dart';
import 'package:pizza_delivery/cart_button.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/order/pizza.dart';
import 'package:pizza_delivery/order_pizza_card.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PizzaDeliveryLocalizations.of(context).orderTitle),
        actions: <Widget>[CartButton()],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount:
              // If we are in a portrait mode use 1 column, otherwise use 2 columns
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 1
                  : 2,
          childAspectRatio: 2,
          children:
              pizzaList.map((pizza) => OrderPizzaCard(pizza: pizza)).toList(),
        ),
      ),
    );
  }
}
