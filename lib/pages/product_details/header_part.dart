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
                itemCount: contoller.productDetails.value.files.length,
                itemBuilder: (context, index, realIndex) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: GlobalImage.globalImage(
                        contoller.productDetails.value.files[index].path),
                  ),
                ),
                options: CarouselOptions(
                  aspectRatio: 16 / 9.5,
                  autoPlayInterval: Duration(seconds: 3),
                  enableInfiniteScroll: false,
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
                    "${contoller.productDetails.value.name}",
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
