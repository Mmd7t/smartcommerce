import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoriesSectorOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider.builder(
          itemCount: 10,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    Container(
                      width: constraints.maxWidth - 18,
                      height: constraints.maxWidth - 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/product_image.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'name',
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }),
            );
          },
          options: CarouselOptions(
            enlargeCenterPage: true,
            viewportFraction: 0.3,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            aspectRatio: 3 / 5,
            onPageChanged: (index, reason) {},
          ),
        ),
      ),
    );
  }
}
