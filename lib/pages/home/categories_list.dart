import 'package:flutter/material.dart';

class HomeCategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width * 0.37,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: size.width * 0.3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    maxRadius: size.width * 0.13,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: AssetImage('assets/product_image.png'),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '',
                    maxLines: 3,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
