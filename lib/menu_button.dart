import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  MenuButton({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
