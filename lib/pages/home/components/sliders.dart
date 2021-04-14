import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smartcommerce/widgets/indicators.dart';

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //   alignment: Alignment.topCenter,
                  //   image:
                  //       NetworkImage(sliders[0].slides[index].file.path),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 15 / 7.5,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Indicators(cindex: currentIndex, length: 5),
        ],
      ),
    );
  }
}
