import 'package:contacts_service/contacts_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pizza_delivery/contact_chooser.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:pizza_delivery/order/pizza.dart';
import 'package:pizza_delivery/pizza/pizza_toppings.dart';
import 'package:provider/provider.dart';

class CartPizzaCard extends StatelessWidget {
  final Pizza pizza;

  CartPizzaCard({Key key, @required this.pizza}) : super(key: key);

  void removePizzaFromCart(BuildContext context) {
    Provider.of<CartModel>(context, listen: false).remove(pizza);
  }

  void chooseAContact(BuildContext context) async {
    if (await Permission.contacts.request().isGranted) {
      Contact contact = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ContactChooser()),
      );

      Provider.of<CartModel>(context, listen: false).setEater(pizza, contact);
    } else if (await Permission.contacts.isPermanentlyDenied) {
      openAppSettings();
    } else {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
                PizzaDeliveryLocalizations.of(context).canNotAccessToContacts),
          ),
        );
    }
  }

  void removeSelectedContact(BuildContext context) {
    Provider.of<CartModel>(context, listen: false).setEater(pizza, null);
  }

  void addPizzaToCart(BuildContext context) {
    Provider.of<CartModel>(context, listen: false)
        .add(Pizza(pizza.name, pizza.image, pizza.price, pizza.toppings));
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency(
        locale: PizzaDeliveryLocalizations.of(context).localeName);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        pizza.name,
                        style: TextStyle(fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {
                          removePizzaFromCart(context);
                        },
                        icon: Icon(Icons.remove_shopping_cart),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      PizzaToppings(pizza: pizza),
                      Text(
                        '${formatCurrency.format(pizza.price)}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          RaisedButton.icon(
                            onPressed: () {
                              chooseAContact(context);
                            },
                            icon: Icon(Icons.contacts),
                            label: Text(pizza.whoWillEat?.displayName ??
                                PizzaDeliveryLocalizations.of(context)
                                    .whoWillEat),
                          ),
                          if (pizza.whoWillEat != null)
                            IconButton(
                              onPressed: () {
                                removeSelectedContact(context);
                              },
                              icon: Icon(Icons.remove_circle),
                            ),
                        ],
                      ),
                      RaisedButton(
                        onPressed: () {
                          addPizzaToCart(context);
                        },
                        child: Icon(Icons.plus_one),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
