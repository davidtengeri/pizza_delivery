import 'package:flutter/material.dart';

import 'package:pizza_delivery/app_colors.dart';

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
  var options = [
    'I want to order a pizza',
    'I want to see my favourite pizzas',
    'I want to check my profile',
  ];

  var currentIndex = 0;

  void selectOption(int idx) {
    setState(() {
      currentIndex = idx;
      print('Pressed $currentIndex');
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
          Text('What do you want?'),
          Text(options[currentIndex]),
          RaisedButton(
            onPressed: () => selectOption(0),
            child: Text('Order'),
          ),
          RaisedButton(
            onPressed: () => selectOption(1),
            child: Text('Favourites'),
          ),
          RaisedButton(
            onPressed: () {
              selectOption(2);
            },
            child: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
