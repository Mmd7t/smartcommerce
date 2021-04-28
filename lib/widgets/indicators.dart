import 'package:flutter/material.dart';

class Indicators extends StatelessWidget {
  final int cindex;
  final int length;

  Indicators({Key key, this.cindex, this.length}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: (index == cindex) ? 15 : 8,
          height: (index == cindex) ? 5 : 8,
          decoration: BoxDecoration(
            color: (index == cindex)
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(100),
            border: (index == cindex)
                ? Border.fromBorderSide(BorderSide.none)
                : Border.all(color: Colors.white, width: 1.2),
          ),
        ),
      ),
    );
  }
}
