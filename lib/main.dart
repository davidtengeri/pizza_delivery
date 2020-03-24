import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:pizza_delivery/app_colors.dart';
import 'package:pizza_delivery/main_drawer.dart';
import 'package:pizza_delivery/main_menu.dart';
import 'package:pizza_delivery/menu_item.dart';
import 'package:pizza_delivery/order.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/order': (context) => Order(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedPizza;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Delivery'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          MainMenu(),
          if (selectedPizza != null) Text(selectedPizza),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            '/order',
            arguments: OrderArguments('Floating action'),
          );
          setState(() {
            selectedPizza = result;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.all(5),
          child: SvgPicture.asset('images/pizza.svg'),
        ),
      ),
    );
  }
}
