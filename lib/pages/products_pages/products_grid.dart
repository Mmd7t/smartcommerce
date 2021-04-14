import 'package:flutter/material.dart';

import 'product_details/product_details_page.dart';

class ProductsGrid extends StatelessWidget {
  static const double radius = 10;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: 15,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            splashColor: Theme.of(context).accentColor,
            onTap: () =>
                Navigator.of(context).pushNamed(ProductDetails.routeName),
            child: GridTile(
/*------------------------------------------------------------------------------*/
/*----------------------------------  Footer  ----------------------------------*/
/*------------------------------------------------------------------------------*/
              footer: footer(
                name: "Food",
                context: context,
                price: "15.00 EGP",
              ),
/*------------------------------------------------------------------------------*/
/*----------------------------------  Header  ----------------------------------*/
/*------------------------------------------------------------------------------*/
              header: header(
                context: context,
                data: " product[index]",
              ),
/*------------------------------------------------------------------------------*/
/*----------------------------------  Child  -----------------------------------*/
/*------------------------------------------------------------------------------*/
              child: child(
                context: context,
                img:
                    "https://purepng.com/public/uploads/large/purepng.com-food-platefood-meat-plate-tasty-grill-breakfast-dinner-french-fries-launch-941524624215fnp4x.png",
              ),
            ),
          ),
        );
      },
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
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.clip,
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
  header({context, data}) {
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
            Image.network(img, height: 100),
          ],
        ),
      ),
    );
  }
}
