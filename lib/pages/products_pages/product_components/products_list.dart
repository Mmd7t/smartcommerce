import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/widgets/global_image.dart';

import '../product_details/product_details_page.dart';

class ProductsList extends StatelessWidget {
  static const double radius = 10;
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: ProductsController(),
      builder: (ProductsController controller) {
        return ListView.builder(
          itemCount: controller.brandProducts.value.products.data.length,
          itemBuilder: (context, index) {
            List<ProductData> data =
                controller.brandProducts.value.products.data;
            return InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: Theme.of(context).primaryColor,
              onTap: () =>
                  Navigator.of(context).pushNamed(ProductDetails.routeName),
              child: Card(
                margin: const EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: AspectRatio(
                  aspectRatio: 16 / 5,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            leading(
                                context: context, img: data[index].baseImage),
                            const SizedBox(width: 15),
                            title(
                                name: data[index].name,
                                context: context,
                                price: data[index].formattedPrice.formatted),
                          ],
                        ),
                        trailing(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Footer Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  title({name, context, price}) {
    return Column(
      children: [
        Text(name),
        Text(price),
      ],
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Header Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  trailing({context, data}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.amber[700],
          ),
          onPressed: () {},
        ),
      ],
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Child Function  -------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  leading({context, img}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Theme.of(context).accentColor),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).accentColor),
            ),
            child: GlobalImage.globalImage(img),
          ),
        ),
      ),
    );
  }
}
