import 'package:flutter/material.dart';

class ProductsCategories extends StatefulWidget {
  @override
  _ProductsCategoriesState createState() => _ProductsCategoriesState();
}

class _ProductsCategoriesState extends State<ProductsCategories> {
  int choiceIndex = 0;
  static const List _cast = [
    'All',
    'Trousers',
    'Shoes',
    'Shirts',
  ];
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 2,
      child: Container(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.generate(
            _cast.length,
            (index) => ChoiceChip(
              label: Text(_cast[index]),
              selected: choiceIndex == index,
              side: (choiceIndex == index)
                  ? BorderSide(color: Theme.of(context).accentColor, width: 1.5)
                  : BorderSide.none,
              // selectedColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              onSelected: (value) {
                setState(() {
                  choiceIndex = value ? index : null;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
