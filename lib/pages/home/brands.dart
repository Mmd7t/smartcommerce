import 'package:flutter/material.dart';
import 'package:smartcommerce/pages/products_pages/products.dart';

class HomeBrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      width: size.width,
      height: size.width * 0.35,
      alignment: Alignment.center,
      child:  ListView.builder(
              itemCount:7,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed(Products.routeName),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.amber[700],
                                  width: 1.5,
                                ),
                                // image: DecorationImage(
                                //   image:Asse,
                                //   fit: BoxFit.fitWidth,
                                //   alignment: Alignment.center,
                                // ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('brands[index].name'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
