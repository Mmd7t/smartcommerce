import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:smartcommerce/controllers/category_controller.dart';
import 'package:smartcommerce/widgets/custom_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

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
      child: GetX(
          init: CategoryController(),
          builder: (CategoryController controller) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: SingleChildScrollView(
                child: Center(
                  child: controller.subCategoriesListLoader() == true
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Center(
                            child: circularDefaultProgress(context),
                          ),
                        )
                      : Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 10.0,
                          spacing: 10.0,
                          children: List.generate(
                            controller.subCategoriesList().length,
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
                                  border: Border.all(
                                      color: Colors.amber[700], width: 1.5),
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
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: cachedNetworkImageProvider(
                                          controller
                                              .subCategoriesList()[index]
                                              .logo
                                              .path),
                                    ),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      cachedNetworkImage(
                                          controller
                                              .subCategoriesList()[index]
                                              .logo
                                              .path,
                                          radius: 15.0),
                                      Container(
                                        height: 25,
                                        child: GridTileBar(
                                          backgroundColor: Colors.black26,
                                          title: Text(
                                            controller
                                                .subCategoriesList()[index]
                                                .name
                                                .toString(),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            );
          }),
    );
  }
}
