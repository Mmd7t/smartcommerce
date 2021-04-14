import 'package:flutter/material.dart';

class TwoBanners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.red,
                // image: DecorationImage(
                //   image: NetworkImage(banners.banner1.image.path),
                //   fit: BoxFit.cover,
                //   alignment: Alignment.topCenter,
                // ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.red,
                // image: DecorationImage(
                //   image: NetworkImage(banners.banner2.image.path),
                //   fit: BoxFit.cover,
                //   alignment: Alignment.topCenter,
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
