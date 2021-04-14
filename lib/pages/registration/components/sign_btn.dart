import 'package:flutter/material.dart';

class SignBtn extends StatelessWidget {
  final String text;
  final Function onClicked;

  const SignBtn({Key key, this.text, this.onClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: RadialGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
          radius: 5,
        ),
      ),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.button.copyWith(color: Colors.white),
        ),
        onPressed: onClicked,
      ),
    );
  }
}
