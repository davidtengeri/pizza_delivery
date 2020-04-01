import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizza_delivery/cart_button.dart';

import 'package:pizza_delivery/app_colors.dart';
import 'package:pizza_delivery/main_drawer.dart';
import 'package:pizza_delivery/order.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:pizza_delivery/pizza_delivery_logo.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: PizzaDeliveryApp(),
    ));

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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Delivery'),
        actions: <Widget>[CartButton()],
      ),
      drawer: MainDrawer(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(25),
        child: PizzaDeliveryLogo(Theme.of(context).primaryColor),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/order',
          );
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
