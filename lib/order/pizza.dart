import 'package:contacts_service/contacts_service.dart';
import 'package:quiver/core.dart';

class Topping {
  String name;
  String image;

  Topping(this.name, this.image);

  Topping.mozzarella() : this('mozzarella', 'images/mozzarella.svg');
  Topping.paprika() : this('paprika', 'images/chili.svg');
  Topping.tomato() : this('tomato', 'images/tomato.svg');
  Topping.ham() : this('ham', 'images/ham.svg');
  Topping.salami() : this('salami', 'images/salami.svg');
}

class Pizza {
  String name;
  String image;
  List<Topping> toppings;
  double price;
  Contact whoWillEat;

  Pizza(this.name, this.image, this.price, this.toppings);

  bool operator ==(Object other) =>
      other is Pizza &&
      other.image == image &&
      other.name == name &&
      other.price == price &&
      other.whoWillEat == whoWillEat;

  int get hashCode =>
      hash4(name.hashCode, image.hashCode, price.hashCode, whoWillEat.hashCode);
}

final pizzaList = [
  Pizza('Margherita', 'images/pizza-margherita.jpg', 1400, [
    Topping.mozzarella(),
    Topping.tomato(),
  ]),
  Pizza('Ham', 'images/pizza-ham.jpg', 1500, [
    Topping.mozzarella(),
    Topping.ham(),
  ]),
  Pizza('Salami', 'images/pizza-salami.jpg', 1500, [
    Topping.mozzarella(),
    Topping.paprika(),
    Topping.salami(),
  ]),
  Pizza('Hot Salami', 'images/pizza-pepperoni.png', 1700, [
    Topping.mozzarella(),
    Topping.paprika(),
    Topping.salami(),
  ]),
  Pizza('Veggie', 'images/pizza-veggie.jpg', 1600, [
    Topping.mozzarella(),
    Topping.paprika(),
    Topping.tomato(),
  ]),
  Pizza('Ham and Salami', 'images/pizza-ham-salami.jpg', 2000, [
    Topping.mozzarella(),
    Topping.ham(),
    Topping.salami(),
  ]),
];
