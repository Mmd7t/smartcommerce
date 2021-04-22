import 'package:flutter/material.dart';

class GridToListChanger extends StatefulWidget {
  @override
  _GridToListChangerState createState() => _GridToListChangerState();
}

class _GridToListChangerState extends State<GridToListChanger> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color:
            Theme.of(context).inputDecorationTheme.fillColor.withOpacity(0.2),
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0.0),
        splashRadius: Material.defaultSplashRadius - 5,
        splashColor: Theme.of(context).primaryColor,
        icon: const Icon(Icons.list_rounded),
        color: Theme.of(context).accentColor,
        onPressed: () {},
      ),
    );
  }
}
