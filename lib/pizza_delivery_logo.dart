import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';

class PizzaDeliveryLogo extends StatelessWidget {
  final Color textColor;

  PizzaDeliveryLogo(this.textColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          PizzaDeliveryLocalizations.of(context).appTitle,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
        SvgPicture.asset(
          'images/delivery-truck.svg',
          width: 60,
          height: 60,
        ),
      ],
    );
  }
}
