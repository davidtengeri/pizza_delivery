import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:pizza_delivery/order/pizza.dart';

void main() {
  group('CartModel', () {
    test('stores pizza', () {
      var model = CartModel();
      model.add(pizzaList[0]);

      expect(model.items.length, 1);
    });

    test('counts the total value', () {
      var model = CartModel();
      model.add(pizzaList[0]);
      model.add(pizzaList[1]);

      expect(model.total, 2900);
    });
  });
}
