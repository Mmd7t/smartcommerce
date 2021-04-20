import 'package:flutter/material.dart';

class StickyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MyDelegate(
        TabBar(
          tabs: const [
            Tab(icon: const Text("Description")),
            Tab(icon: const Text("Reviews")),
          ],
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.red,
        ),
      ),
      floating: true,
      pinned: true,
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
