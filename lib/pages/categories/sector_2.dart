import 'package:flutter/material.dart';

class CategoriesSectorTwo extends StatelessWidget {
  static const colors = [
    Colors.indigo,
    Colors.red,
    Colors.teal,
    Colors.deepPurple,
    Colors.pink,
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      flex: 3,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 10.0,
              spacing: 10.0,
              children: List.generate(
                4,
                (index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: AnimatedContainer(
                    padding: const EdgeInsets.all(4),
                    duration: const Duration(milliseconds: 500),
                    width: size.width * 0.43,
                    height: size.width * 0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.amber[700], width: 1.5),
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: size.width * 0.43,
                      height: size.width * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.amber[700],
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
