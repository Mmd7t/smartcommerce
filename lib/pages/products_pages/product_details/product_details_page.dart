import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/widgets/progress.dart';
import 'description_part.dart';
import 'header_part.dart';
import 'reviews_part.dart';
import 'sticky_header.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName = 'productDetails';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  final contoller = Get.find<ProductsController>();
  Animation animation, animation2;
  AnimationController animationController;
  var pages = [
    DescriptionPart(),
    ReviewsPart(),
  ];
  double high;
  bool isClicked;
  Timer time;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
    time.cancel();
  }

  @override
  void initState() {
    super.initState();
    high = 50;
    isClicked = false;
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    time = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (timer.tick <= 5) {
          if (timer.tick == 1) {
            setState(() {
              high = 200;
              isClicked = true;
              animationController.forward();
            });
          } else if (timer.tick == 5) {
            setState(() {
              high = 50;
              isClicked = false;
              animationController.reverse();
            });
          }
        } else {
          timer.cancel();
        }
      },
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animation2 = Tween(begin: 1.0, end: 0.0).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        extendBody: true,
        body: (contoller.productDetails == null)
            ? Center(child: circularProgress(context))
            : DefaultTabController(
                length: 2,
                child: NestedScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  headerSliverBuilder: (context, isScolled) {
                    return [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        collapsedHeight:
                            MediaQuery.of(context).size.height * 0.4,
                        expandedHeight:
                            MediaQuery.of(context).size.height * 0.4,
                        flexibleSpace: HeaderPart(),
                      ),
                      StickyHeader(),
                    ];
                  },
                  body: TabBarView(children: pages),
                ),
              ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: kToolbarHeight + 10,
                width: MediaQuery.of(context).size.width * 0.40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).accentColor, width: 1.6),
                ),
                child:
                    Html(data: contoller.productDetails.value.formattedPrice),
              ),
              /*----------------------------------  Add to Cart  ------------------------------------*/
              MaterialButton(
                child: const Text("Add to Cart"),
                color: Colors.red,
                onPressed: () {},
                height: 50,
                minWidth: MediaQuery.of(context).size.width * 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
