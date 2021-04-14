import 'package:flutter/material.dart';

class GlobalImage extends StatelessWidget {
  String url;

  GlobalImage({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (!url.contains('https')) {
      url = url.replaceAll('http', 'https');
    }
    return (url == null)
        ? Image.asset('assets/product_image.png')
        : Image.network(url);
  }
}
