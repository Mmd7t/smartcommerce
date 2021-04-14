import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smartcommerce/widgets/indicators.dart';

class OffersBanners extends StatefulWidget {
  @override
  _OffersBannersState createState() => _OffersBannersState();
}

class _OffersBannersState extends State<OffersBanners> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 4,
            itemBuilder: (context, index, i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 16 / 7,
              viewportFraction: 0.96,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Indicators(cindex: currentIndex),
        ],
      ),
    );
  }
}
