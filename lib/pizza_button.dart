import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PizzaButton extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const PizzaButton({Key key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: padding,
      child: SvgPicture.asset(
        'images/pizza.svg',
      ),
    );
  }
}
