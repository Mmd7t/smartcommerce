import 'dart:convert';

import 'package:flutter/material.dart';

class Constants {
  static const String baseUrl = 'https://market.smartcommerce.me/ar/api/';
  static const String apiKey = 'apiKey';
  static const String username = 'smartcommerce';
  static const String password = 'smart2020';
  static final String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'authorization': basicAuth,
  };

  static showMessageDialog(context, text) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(text),
        title: Text("error happened"),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'))
        ],
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Onboarding Images  ----------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/

  static const List<String> onboardingImages = [
    'assets/smart_commerce.gif',
    'assets/market_slide_1.png',
    'assets/market_slide_2.png',
    'assets/market_slide_3.png',
    'assets/market_slide_4.png',
  ];
}
