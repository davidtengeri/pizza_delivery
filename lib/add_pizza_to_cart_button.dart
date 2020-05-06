import 'package:flutter/material.dart';
import 'package:pizza_delivery/order/cart_model.dart';
import 'package:pizza_delivery/pizza_button.dart';
import 'package:provider/provider.dart';

import 'order/pizza.dart';

class AddPizzaToCartButton extends StatefulWidget {
  final Pizza pizza;
  final IconData icon;

  const AddPizzaToCartButton(
      {Key key, @required this.pizza, this.icon = Icons.add})
      : super(key: key);
  @override
  _AddPizzaToCartButtonState createState() => _AddPizzaToCartButtonState();
}

class _AddPizzaToCartButtonState extends State<AddPizzaToCartButton>
    with SingleTickerProviderStateMixin {
  // Controls the animation
  AnimationController _controller;
  // Stores the current value of the animation for every frame that the system draws
  Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      // The duration of the animation will be 0.5 seconds
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    // This creates the values based on a curve.
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void addPizzaToCart(BuildContext context) {
    Provider.of<CartModel>(context, listen: false).add(widget.pizza);
  }

  Future<void> runAnimation(BuildContext context) async {
    // Gets a reference to the drawed box on the screen.
    final RenderBox renderBox = context.findRenderObject();
    // Calculates its position relative to the top left corner.
    final widgetPosition = renderBox.localToGlobal(Offset.zero);
    // The drawed box size can be accessed through the render object.
    final widgetWidth = renderBox.size.width;
    // Gets the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    // An overlay entry is a widget that can be inserted on top of the currently visible ones.
    var entry = OverlayEntry(
      // We build our animation with the help of AnimatedBuilder. It will redraw itself if the value in the animation changes
      builder: (context) => AnimatedBuilder(
        animation: _animation,
        // The pizza icon will be the child. We modify its position when the value in the animation changes.
        builder: (context, child) => Positioned(
          left: (widgetPosition.dx + widgetWidth / 2) +
              (screenWidth - widgetPosition.dx - widgetWidth / 2 - 45) *
                  (_animation.value),
          top: 25 + (widgetPosition.dy - 30) * (1 - _animation.value),
          child: child,
        ),
        // The pizza icon that will be animated
        child: Container(
          child: PizzaButton(),
          width: 30,
          height: 30,
        ),
      ),
    );
    // Add the piza icon on top of the corrently visible widgets
    Overlay.of(context).insert(entry);
    // Start the animation through the controller and wait until it is finished.
    await _controller.forward(from: 0);
    // Once the animation is finished, remove the entry.
    entry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        addPizzaToCart(context);
        runAnimation(context);
      },
      child: Icon(widget.icon),
    );
  }
}
