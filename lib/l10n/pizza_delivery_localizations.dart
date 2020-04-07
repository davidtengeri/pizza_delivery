import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizza_delivery/l10n/messages_all.dart';

class PizzaDeliveryLocalizations {
  final String localeName;

  PizzaDeliveryLocalizations(this.localeName);

  static Future<PizzaDeliveryLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    print(localeName);

    return initializeMessages(localeName).then((_) {
      return PizzaDeliveryLocalizations(localeName);
    });
  }

  static PizzaDeliveryLocalizations of(BuildContext context) {
    return Localizations.of<PizzaDeliveryLocalizations>(
        context, PizzaDeliveryLocalizations);
  }

  static const LocalizationsDelegate<PizzaDeliveryLocalizations> delegate =
      _PizzaDeliveryLocalizationDelegate();

  String get appTitle {
    return Intl.message(
      'Pizza Delivery',
      name: 'appTitle',
      locale: localeName,
    );
  }

  String get orderTitle {
    return Intl.message(
      'Order a pizza',
      name: 'orderTitle',
      desc: 'Title for the Order screen',
      locale: localeName,
    );
  }

  String get orderMenu {
    return Intl.message(
      'Order',
      name: 'orderMenu',
      locale: localeName,
    );
  }

  String get favouritesMenu {
    return Intl.message(
      'Favourites',
      name: 'favouritesMenu',
      locale: localeName,
    );
  }

  String get profileMenu {
    return Intl.message(
      'Profile',
      name: 'profileMenu',
      locale: localeName,
    );
  }

  String get inCart {
    return Intl.message(
      'In cart',
      name: 'inCart',
      locale: localeName,
    );
  }
}

class _PizzaDeliveryLocalizationDelegate
    extends LocalizationsDelegate<PizzaDeliveryLocalizations> {
  const _PizzaDeliveryLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hu'].contains(locale.languageCode);

  @override
  Future<PizzaDeliveryLocalizations> load(Locale locale) =>
      PizzaDeliveryLocalizations.load(locale);

  @override
  bool shouldReload(_PizzaDeliveryLocalizationDelegate old) => false;
}
