import 'package:flutter/material.dart';
import 'package:smartcommerce/models/product_data.dart';

import '../global_image.dart';

class ProductGridItem extends StatelessWidget {
  final ProductData data;
  static const double radius = 10;

  @override
  Widget build(BuildContext context) {
    return GridTile(
/*------------------------------------------------------------------------------*/
/*----------------------------------  Footer  ----------------------------------*/
/*------------------------------------------------------------------------------*/
      footer: footer(
        name: "${data.name}",
        context: context,
        price: "${data.formattedPrice.formatted}",
      ),
/*------------------------------------------------------------------------------*/
/*----------------------------------  Header  ----------------------------------*/
/*------------------------------------------------------------------------------*/
      header: header(context),
/*------------------------------------------------------------------------------*/
/*----------------------------------  Child  -----------------------------------*/
/*------------------------------------------------------------------------------*/
      child: child(
        context: context,
        img: "${data.baseImage}",
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Footer Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  footer({name, context, price}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
                endIndent: 20, indent: 20, height: 20, color: Colors.red),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.clip,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$price',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Header Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  header(context) {
    // bool isAddedToCart = await CartDB().getDataById(data.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  child({context, img}) {
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.all(5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
        padding: const EdgeInsets.all(10).copyWith(top: 30),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(0, 1),
              color: Colors.black12,
            )
          ],
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: const Text(''),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              width: 70,
              height: 70,
            ),
            GlobalImage.globalImage(img),
          ],
        ),
      ),
    );
  }

  ProductGridItem(this.data);
}
