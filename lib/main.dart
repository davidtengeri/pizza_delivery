import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizza_delivery/cart.dart';
import 'package:pizza_delivery/cart_button.dart';

import 'package:pizza_delivery/app_colors.dart';
import 'package:pizza_delivery/contact_chooser.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/main_drawer.dart';
import 'package:pizza_delivery/order.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:pizza_delivery/order/favourites_model.dart';
import 'package:pizza_delivery/pizza_delivery_logo.dart';
import 'package:pizza_delivery/profile.dart';
import 'package:pizza_delivery/profile/profile_repository.dart';
import 'package:pizza_delivery/sql.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final camera = cameras.first;

  final sql = Sql();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => FavouritesModel()),
        Provider(create: (_) => ProfileRepository(sql: sql)),
        Provider.value(value: camera),
      ],
      child: PizzaDeliveryApp(),
    ),
  );
}

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
        '/': (_) => Home(),
        '/order': (_) => Order(),
        '/profile': (_) => Profile(),
        '/cart': (_) => Cart(),
      },
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        PizzaDeliveryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('hu', ''),
      ],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PizzaDeliveryLocalizations.of(context).appTitle),
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
