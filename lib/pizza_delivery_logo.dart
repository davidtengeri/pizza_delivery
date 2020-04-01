import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PizzaDeliveryLogo extends StatelessWidget {
  final Color textColor;

  PizzaDeliveryLogo(this.textColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Pizza Delivery',
          style: TextStyle(
            fontSize: 30,
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
