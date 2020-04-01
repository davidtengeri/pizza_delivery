import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:pizza_delivery/order/pizza.dart';
import 'package:provider/provider.dart';

class PizzaCard extends StatelessWidget {
  final Pizza pizza;

  PizzaCard({Key key, @required this.pizza}) : super(key: key);

  void addPizzaToCart(BuildContext context, Pizza pizza) {
    Provider.of<CartModel>(context, listen: false).add(pizza);
  }

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    pizza.name,
                    style: TextStyle(fontSize: 24),
                  ),
                  PizzaToppings(pizza: pizza),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${pizza.price} Ft',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: RaisedButton(
                          onPressed: () {
                            addPizzaToCart(context, pizza);
                          },
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PizzaToppings extends StatelessWidget {
  final Pizza pizza;

  const PizzaToppings({
    Key key,
    @required this.pizza,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: pizza.toppings
          .map(
            (topping) => ToppingImage(
              topping: topping,
            ),
          )
          .toList(),
    );
  }
}

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
