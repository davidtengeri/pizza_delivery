import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:pizza_delivery/order/favourites_model.dart';
import 'package:pizza_delivery/order/pizza.dart';
import 'package:pizza_delivery/pizza/pizza_toppings.dart';
import 'package:provider/provider.dart';

class OrderPizzaCard extends StatelessWidget {
  final Pizza pizza;

  OrderPizzaCard({Key key, @required this.pizza}) : super(key: key);

  void addPizzaToCart(BuildContext context) {
    Provider.of<CartModel>(context, listen: false).add(pizza);
  }

  void markPizzaAsFavourite(BuildContext context) {
    Provider.of<FavouritesModel>(context, listen: false).add(pizza);
  }

  void markPizzaAsNotFavourite(BuildContext context) {
    Provider.of<FavouritesModel>(context, listen: false).remove(pizza);
  }

  bool isFavourite(BuildContext context) =>
      Provider.of<FavouritesModel>(context).isFavourite(pizza);

  bool isInCart(BuildContext context) =>
      Provider.of<CartModel>(context).isInCart(pizza);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency(
        locale: PizzaDeliveryLocalizations.of(context).localeName);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  pizza.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              flex: 2,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        pizza.name,
                        style: TextStyle(fontSize: 24),
                      ),
                      if (isInCart(context))
                        Text(PizzaDeliveryLocalizations.of(context).inCart),
                    ],
                  ),
                  PizzaToppings(pizza: pizza),
                  Row(
                    children: <Widget>[
                      Text(
                        '${formatCurrency.format(pizza.price)}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          addPizzaToCart(context);
                        },
                        child: Icon(Icons.add),
                      ),
                      if (isFavourite(context))
                        RaisedButton(
                          onPressed: () {
                            markPizzaAsNotFavourite(context);
                          },
                          color: Theme.of(context).accentColor,
                          child: SvgPicture.asset(
                            'images/favourites.svg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      if (!isFavourite(context))
                        RaisedButton(
                          onPressed: () {
                            markPizzaAsFavourite(context);
                          },
                          child: SvgPicture.asset(
                            'images/favourites.svg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
