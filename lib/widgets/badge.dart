import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;
  Badge({@required this.child,@required this.value, this.color});
  @override
  Widget build(BuildContext context) {
//    print('${value.compareTo('1')}');
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        value.compareTo('0')==0?Container():
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            padding: EdgeInsets.all(0.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: color != null ? color : Colors.redAccent),
            constraints: BoxConstraints(
              minWidth: 13,
              minHeight: 13,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12,color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
