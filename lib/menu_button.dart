import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final String iconAssetName;

  MenuButton({this.onPressed, this.text, this.iconAssetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                iconAssetName,
                width: 40,
                height: 40,
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
