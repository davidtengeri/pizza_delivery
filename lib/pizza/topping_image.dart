import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_delivery/order/pizza.dart';

class ToppingImage extends StatelessWidget {
  final Topping topping;

  const ToppingImage({Key key, @required this.topping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SvgPicture.asset(
        topping.image,
        width: 30,
        height: 30,
      ),
    );
  }
}
