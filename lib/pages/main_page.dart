import 'package:flutter/material.dart';
import 'package:smartcommerce/widgets/drawer.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:smartcommerce/widgets/rounded_bottom_sheet.dart';
import 'package:get/get.dart';
import 'FlashSale_Page/FlashSalePage.dart';
import 'categories/categories_page.dart';
import 'home/home.dart';
import 'profile/profile.dart';

class MainPage extends StatefulWidget {
  static const String routeName = 'mainPage';
  final int initial;
  @override
  _MainPageState createState() => _MainPageState();

  MainPage({this.initial = 0});
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    Home(),
    ProfilePage(),
    CategoriesPage(),
    FlashSalePage(),
    Container(),
  ];

  int pageIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.initial;
    pageController = PageController(initialPage: widget.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      drawer: MyDrawer(),
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) => setState(() => pageIndex = index),
        physics: NeverScrollableScrollPhysics(),
        children: pages,
      ),
      extendBody: true,
      bottomNavigationBar: Card(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BottomNavigationBar(
            elevation: 3,
            currentIndex: pageIndex,
            onTap: (value) {
              if (value != 4) {
                pageController.jumpToPage(value);
              } else {
                roundedBorderBottomSheet(context);
              }
            },
            selectedItemColor: Theme.of(context).primaryColor,
            selectedIconTheme:
                IconThemeData(color: Theme.of(context).accentColor),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.grey.shade600,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home),
                label: 'home'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                activeIcon: const Icon(Icons.person),
                label: 'me'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.category_outlined),
                activeIcon: const Icon(Icons.category),
                label: 'cats'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.local_offer_outlined),
                activeIcon: const Icon(Icons.local_offer),
                label: 'offers'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.add_circle_outline),
                activeIcon: const Icon(Icons.add_circle),
                label: 'more'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
