import 'package:flutter/material.dart';

class OrderArguments {
  String from;

  OrderArguments(this.from);
}

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrderArguments orderArguments = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order a pizza'),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Text('You came here by ${orderArguments.from}'),
              RaisedButton(
                onPressed: () => Navigator.pop(context, 'Margherita'),
                child: Text('Margherita'),
              ),
              RaisedButton(
                onPressed: () => Navigator.pop(context, 'Pepperoni'),
                child: Text('Pepperoni'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
