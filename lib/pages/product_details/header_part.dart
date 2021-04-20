import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/widgets/global_image.dart';

class HeaderPart extends StatefulWidget {
  @override
  _HeaderPartState createState() => _HeaderPartState();
}

class _HeaderPartState extends State<HeaderPart> {
  int currentIndex = 0;
  final contoller = Get.find<ProductsController>();
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
                      child: GlobalImage.globalImage(
                          contoller.productDetails.value.baseImage.path),
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
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    "${contoller.productDetails.value.brand.name}",
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
