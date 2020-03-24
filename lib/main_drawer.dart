import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_delivery/main_menu.dart';
import 'package:pizza_delivery/menu_item.dart';

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
            child: Column(
              children: <Widget>[
                Text(
                  'Pizza Delivery',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                SvgPicture.asset(
                  'images/delivery-truck.svg',
                  width: 60,
                  height: 60,
                ),
              ],
            ),
          ),
          MainMenu(),
        ],
      ),
    );
  }
}
