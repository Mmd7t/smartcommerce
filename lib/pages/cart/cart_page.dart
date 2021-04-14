import 'package:flutter/material.dart';
import 'package:smartcommerce/pages/main_page.dart';

class CartPage extends StatelessWidget {
  static const String routeName = 'cartPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ic_clear_shopping_cart.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            const SizedBox(height: 10),
            Text('عربة التسوق فارغة'),
            const SizedBox(height: 10),
            MaterialButton(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(MainPage.routeName),
              child: Text(
                'مواصلة التسوق',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
