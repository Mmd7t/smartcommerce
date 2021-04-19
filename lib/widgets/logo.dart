import 'package:flutter/material.dart';

Image logoImage({double height, double width, fit: BoxFit.fill}) => Image.asset(
      "assets/images/logo.png",
      fit: fit,
      width: width,
      height: height,
    );
