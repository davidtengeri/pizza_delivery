import 'package:flutter/material.dart';
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
          text: 'Order',
          iconAssetName: 'images/pizza.svg',
        ),
        MenuButton(
          onPressed: () => menuItemSelected(MenuItem.favourites, context),
          text: 'Favourites',
          iconAssetName: 'images/favourites.svg',
        ),
        MenuButton(
          onPressed: () => menuItemSelected(MenuItem.profile, context),
          text: 'Profile',
          iconAssetName: 'images/profile.svg',
        ),
      ],
    );
  }
}
