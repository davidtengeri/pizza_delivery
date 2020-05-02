import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizza_delivery/cart_pizza_card.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:provider/provider.dart';

import 'cart_button.dart';
import 'l10n/pizza_delivery_localizations.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency(
        locale: PizzaDeliveryLocalizations.of(context).localeName);

    return Scaffold(
      appBar: AppBar(
        title: Text(PizzaDeliveryLocalizations.of(context).cart),
        actions: <Widget>[CartButton()],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Consumer<CartModel>(builder: (context, cartModel, child) {
          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  PizzaDeliveryLocalizations.of(context).total(
                    formatCurrency.format(cartModel.total),
                  ),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              ...cartModel.items
                  .map((pizza) => CartPizzaCard(pizza: pizza))
                  .toList()
            ],
          );
        }),
      ),
    );
  }
}
