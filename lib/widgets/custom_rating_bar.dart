import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

customRatingBar(
    {@required double value,
    double itemSize = 15,
    unClickable = true,
    onRatingUpdate}) {
  return RatingBar.builder(
    itemSize: itemSize,
    glow: false,
    ignoreGestures: unClickable, //unClickable
    initialRating: value,
//    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.only(left: 0.5),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: onRatingUpdate,
  );
}
