import 'package:flutter/material.dart';

class ProductsSection2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.grid_on),
                onPressed: () {
                  // value.switchView(true);
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  // value.switchView(false);
                },
              ),
            ],
          ),
          const Text('14 عنصر'),
        ],
      ),
    );
  }
}
