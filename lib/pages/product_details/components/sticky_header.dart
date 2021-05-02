import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';

class StickyHeader extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SliverPersistentHeader(
        delegate: MyDelegate(
          TabBar(
            isScrollable: true,
            tabs: const [
              Tab(icon: const Text("Description")),
              Tab(icon: const Text("Reviews")),
              Tab(icon: const Text("Cross Sales")),
              Tab(icon: const Text("Up Sales")),
              Tab(icon: const Text("Related Sales")),
            ],
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            labelColor: Color(appController.primaryColor.value),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(appController.primaryColor.value).withOpacity(0.2),
            ),
          ),
        ),
        floating: true,
        pinned: true,
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: tabBar,
      ),
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height + 5;

  @override
  double get minExtent => tabBar.preferredSize.height + 5;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
