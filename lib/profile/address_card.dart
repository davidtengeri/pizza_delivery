import 'package:flutter/material.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/profile/address_map.dart';
import 'package:pizza_delivery/profile/profile_repository.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  AddressCard({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('${PizzaDeliveryLocalizations.of(context).city}: '),
                Text(address.city),
              ],
            ),
            Row(
              children: <Widget>[
                Text('${PizzaDeliveryLocalizations.of(context).street}: '),
                Text(address.street),
              ],
            ),
            Row(
              children: <Widget>[
                Text('${PizzaDeliveryLocalizations.of(context).houseNumber}: '),
                Text(address.houseNumber),
              ],
            ),
            AddressMap(address: address),
          ],
        ),
      ),
    );
  }
}
