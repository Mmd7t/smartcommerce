import 'package:flutter/material.dart';
import 'package:smartcommerce/utils/constants.dart';

class GlobalAppBar extends PreferredSize {
  final String title;
  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      centerTitle: true,
      title: Text(title),
    );
  }

  GlobalAppBar({this.title = Constants.appName});
}
