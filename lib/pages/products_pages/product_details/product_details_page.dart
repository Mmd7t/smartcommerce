import 'dart:async';
import 'package:flutter/material.dart';
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
              high = 150;
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
    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                collapsedHeight: MediaQuery.of(context).size.height * 0.4,
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
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
            _priceWidget(),
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
    );
  }

  //--**
  /*----------------------------------  Price Widget  ------------------------------------*/
  //--**
  _priceWidget() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.red, width: 1.2),
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          width: high,
          height: 50,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 600),
            opacity: animation2.value,
            child: Text(
              "20",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline6.fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ),
        ),
        GlobalSplash(
          radius: 50,
          onPressed: () {
            if (!isClicked) {
              setState(() {
                high = 150;
                isClicked = true;
                animationController.forward();
              });
            } else {
              setState(() {
                high = 50;
                isClicked = false;
                animationController.reverse();
              });
            }
          },
          child: RotationTransition(
            turns: animation,
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red, width: 1.2),
                shape: BoxShape.circle,
              ),
              child: Text(
                "\$",
                style: Theme.of(context).textTheme.headline5,
              ),
              width: 50,
              height: 50,
            ),
          ),
        ),
      ],
    );
  } //Pri

}

class GlobalSplash extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final double radius;

  const GlobalSplash({Key key, this.onPressed, this.child, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: child,
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
