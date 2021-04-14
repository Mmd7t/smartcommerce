import 'package:flutter/material.dart';

import '../main_page.dart';

class FavoritePage extends StatelessWidget {
  static const String routeName = 'favoritePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              size: 200,
            ),
            const SizedBox(height: 10),
            Text('اضف هنا منتجاتك المفضلة'),
            const SizedBox(height: 10),
            MaterialButton(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(MainPage.routeName),
              child: Text(
                'تصفح المنتجات',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
