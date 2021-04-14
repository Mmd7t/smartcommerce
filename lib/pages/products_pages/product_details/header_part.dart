import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeaderPart extends StatefulWidget {
  @override
  _HeaderPartState createState() => _HeaderPartState();
}

class _HeaderPartState extends State<HeaderPart> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: 2,
                itemBuilder: (context, index, realIndex) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.primaries[index], width: 1.3),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: Image.network(
                          "https://purepng.com/public/uploads/large/purepng.com-food-platefood-meat-plate-tasty-grill-breakfast-dinner-french-fries-launch-941524624215fnp4x.png"),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.97,
                  // autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " product.name",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              IconButton(
                splashColor: Theme.of(context).accentColor,
                splashRadius: 25,
                icon: Icon(
                  Icons.star,
                  size: 30,
                  color: Colors.amber[700],
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
