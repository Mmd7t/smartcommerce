import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GlobalImage {
  static globalImage(url) {
    if (!url.contains('https')) {
      url = url.replaceAll('http', 'https');
    }
    return (url == null)
        ? Image.asset('assets/product_image.png')
        : CachedNetworkImage(imageUrl: url);
  }

  static globalImageProvider(url) {
    if (!url.contains('https')) {
      url = url.replaceAll('http', 'https');
    }
    return (url == null)
        ? AssetImage('assets/product_image.png')
        : CachedNetworkImageProvider(url);
  }
}
