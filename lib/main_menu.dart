import 'package:flutter/material.dart';
import 'package:pizza_delivery/menu_button.dart';
import 'package:pizza_delivery/menu_item.dart';

class MainMenu extends StatelessWidget {
  final Function onOptionSelected;

  MainMenu({@required this.onOptionSelected})
      : assert(onOptionSelected != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MenuButton(
          onPressed: () => onOptionSelected(MenuItem.order),
          text: 'Order',
        ),
        MenuButton(
          onPressed: () => onOptionSelected(MenuItem.favourites),
          text: 'Favourites',
        ),
        MenuButton(
          onPressed: () => onOptionSelected(MenuItem.profile),
          text: 'Profile',
        ),
      ],
    );
  }
}
