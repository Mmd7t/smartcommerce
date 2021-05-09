import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/address_provider.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/controllers/category_controller.dart';
import 'package:smartcommerce/controllers/flashsale_controller.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/controllers/search_controller.dart';
import 'package:smartcommerce/controllers/static_pages_controller.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/helper/language_set_helper.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = 'onBoardingPage';
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with SingleTickerProviderStateMixin {
  var currentPage = 0;
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    getData();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  getData() async {
    await Get.put(AppController(), permanent: true).getUrl();
    await LanguageHelper.uploadLanguage();
    Get.put(AuthController(), permanent: true).getUserProfile();
    Get.put(CartController(), permanent: true).initDB();
    CategoryController category =
        Get.put(CategoryController(), permanent: true);
    HomeController home = Get.put(HomeController(), permanent: true);
    category.getCategoriesParents();
    home.getFeaturedCategories();
    home.getSliders();
    home.getBrands();
    home.getTwoBanners();
    home.getRecentlyAddedProducts();
    Get.put(StaticPagesController(), permanent: true).getStaticPages();
    Get.put(AddressController(), permanent: true).initDB();
    Get.put(FlashSaleController(), permanent: true).getFlashSaleProducts();
    Get.put(ProductsController(), permanent: true);
    Get.put(SearchController(), permanent: true).loadSearchHistory();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> onBoardingPages = [
    OnBoardingPagee(
        key: UniqueKey(),
        text: Constants.onboardingTitles[0].tr,
        img: Constants.onboardingImages[0]),
    OnBoardingPagee(
        key: UniqueKey(),
        text: Constants.onboardingTitles[1].tr,
        img: Constants.onboardingImages[1]),
    OnBoardingPagee(
        key: UniqueKey(),
        text: Constants.onboardingTitles[2].tr,
        img: Constants.onboardingImages[2]),
    OnBoardingPagee(
        key: UniqueKey(),
        text: Constants.onboardingTitles[3].tr,
        img: Constants.onboardingImages[3]),
    OnBoardingPagee(
        key: UniqueKey(),
        text: Constants.onboardingTitles[4].tr,
        img: Constants.onboardingImages[4]),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/intro.png',
              fit: BoxFit.cover, height: size.height, width: size.width),
          Align(
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              reverseDuration: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: onBoardingPages[currentPage],
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          ),
          Positioned(
            bottom: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) => CustomPaint(
                      painter: CirclePaginationPainter(animation.value),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          maxRadius: 25,
                          child: IconButton(
                            color: Theme.of(context).accentColor,
                            icon: const Icon(Icons.arrow_back_ios_rounded),
                            onPressed: () {
                              if (currentPage < 4 && currentPage >= 0) {
                                setState(() {
                                  currentPage = currentPage + 1;
                                });
                                _controller.animateTo(
                                  currentPage / 4,
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Get.put(AuthController(), permanent: true)
                                    .navigate();
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: (currentPage > 0) ? 1 : 0,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      maxRadius: 25,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: (currentPage > 0)
                            ? () {
                                if (currentPage > 0) {
                                  setState(() {
                                    currentPage = currentPage - 1;
                                  });
                                  _controller.animateTo(
                                    currentPage / 4,
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              }
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPagee extends StatelessWidget {
  final String text;
  final String img;

  const OnBoardingPagee({key, this.text, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              img,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePaginationPainter extends CustomPainter {
  final double radius;

  CirclePaginationPainter(this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    double angle = 2 * pi * radius;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        height: size.height,
        width: size.width,
      ),
      -pi / 2,
      angle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CirclePaginationPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CirclePaginationPainter oldDelegate) => true;
}
