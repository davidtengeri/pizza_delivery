import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizza_delivery/app_colors.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: null,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'images/box.svg',
              width: 40,
              height: 40,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                  )),
              padding: EdgeInsets.all(5),
              child: Text(
                Provider.of<CartModel>(context).items.length.toString(),
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
