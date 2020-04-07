import 'package:flutter/material.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/menu_button.dart';
import 'package:pizza_delivery/menu_item.dart';

class MainMenu extends StatelessWidget {
  void menuItemSelected(MenuItem item, BuildContext context) {
    switch (item) {
      case MenuItem.order:
        Navigator.popAndPushNamed(
          context,
          '/order',
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MenuButton(
          onPressed: () => menuItemSelected(MenuItem.order, context),
          text: PizzaDeliveryLocalizations.of(context).orderMenu,
          iconAssetName: 'images/pizza.svg',
        ),
        MenuButton(
          onPressed: () => menuItemSelected(MenuItem.favourites, context),
          text: PizzaDeliveryLocalizations.of(context).favouritesMenu,
          iconAssetName: 'images/favourites.svg',
        ),
        MenuButton(
          onPressed: () => menuItemSelected(MenuItem.profile, context),
          text: PizzaDeliveryLocalizations.of(context).profileMenu,
          iconAssetName: 'images/profile.svg',
        ),
      ],
    );
  }
}
