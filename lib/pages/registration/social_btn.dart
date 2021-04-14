import 'package:flutter/material.dart';

class SocialBtn extends StatelessWidget {
  final IconData icon;
  final Function onClicked;
  final BorderRadius borderRadius;
  final Color color;

  const SocialBtn(
      {Key key, this.icon, this.onClicked, this.borderRadius, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: borderRadius,
      ),
      child: IconButton(
        color: color,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        onPressed: onClicked,
        icon: Icon(icon),
      ),
    );
  }
}
