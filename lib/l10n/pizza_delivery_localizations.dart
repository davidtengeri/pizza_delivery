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

  String get profileTitle {
    return Intl.message(
      'Profile',
      name: 'profileTitle',
      locale: localeName,
    );
  }

  String get profileSaved {
    return Intl.message(
      'Profile saved',
      name: 'profileSaved',
      locale: localeName,
    );
  }

  String get mandatoryField {
    return Intl.message(
      'This field is mandatory',
      name: 'mandatoryField',
      locale: localeName,
    );
  }

  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      locale: localeName,
    );
  }

  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      locale: localeName,
    );
  }

  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      locale: localeName,
    );
  }

  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      locale: localeName,
    );
  }

  String get enterYourPhone {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhone',
      locale: localeName,
    );
  }

  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      locale: localeName,
    );
  }

  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      locale: localeName,
    );
  }

  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      locale: localeName,
    );
  }

  String get city {
    return Intl.message(
      'City',
      name: 'city',
      locale: localeName,
    );
  }

  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      locale: localeName,
    );
  }

  String get houseNumber {
    return Intl.message(
      'House Number',
      name: 'houseNumber',
      locale: localeName,
    );
  }

  String get addAddressDialogTitle {
    return Intl.message(
      'Add a new address',
      name: 'addAddressDialogTitle',
      locale: localeName,
    );
  }

  String get addressSaved {
    return Intl.message(
      'Address saved',
      name: 'addressSaved',
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
