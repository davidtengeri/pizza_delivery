import 'package:flutter/material.dart';
import 'package:pizza_delivery/main_menu.dart';
import 'package:pizza_delivery/pizza_delivery_logo.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            padding: EdgeInsets.all(30),
            child: PizzaDeliveryLogo(Theme.of(context).accentColor),
          ),
          MainMenu(),
        ],
      ),
    );
  }
}
