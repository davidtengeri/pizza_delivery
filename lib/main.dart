import 'package:flutter/material.dart';
import 'package:pizza_delivery/answer.dart';

import 'package:pizza_delivery/app_colors.dart';
import 'package:pizza_delivery/main_menu.dart';
import 'package:pizza_delivery/menu_item.dart';
import 'package:pizza_delivery/question.dart';

void main() => runApp(PizzaDeliveryApp());

class PizzaDeliveryApp extends StatelessWidget {
  ThemeData _buildThemeData() => ThemeData(
        primaryColor: AppColors.primary,
        primaryColorLight: AppColors.primaryLight,
        primaryColorDark: AppColors.primaryDark,
        accentColor: AppColors.accentColor,
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.secondary,
          textTheme: ButtonTextTheme.accent,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildThemeData(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MenuItem selectedItem;

  void selectOption(MenuItem item) {
    setState(() {
      selectedItem = item;
      print('Pressed ${selectedItem.index}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Delivery'),
      ),
      body: Column(
        children: <Widget>[
          Question(),
          Answer(item: selectedItem),
          MainMenu(onOptionSelected: selectOption),
        ],
      ),
    );
  }
}
