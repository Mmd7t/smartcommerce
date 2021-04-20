// import 'dart:async';
//
// import 'package:ecommerce_semicolon/config/lang.dart';
// import 'package:ecommerce_semicolon/controller/cart_provider.dart';
// import 'package:ecommerce_semicolon/controller/orders_provider.dart';
// import 'package:ecommerce_semicolon/controller/user_data_provider.dart';
// import 'package:ecommerce_semicolon/repo/help.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'home.dart';
//
// class OrderSubmit extends StatelessWidget {
//   final subTotal;
//   final shippingFee;
//   final discount;
//   final total;
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.pushAndRemoveUntil(context,
//             MaterialPageRoute(builder: (_) => Home()), (route) => false);
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             color: Theme.of(context).accentColor,
//             icon: Icon(Icons.arrow_back),
//             onPressed: () => Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (_) => Home()), (route) => false),
//           ),
//           title: Text(S.confirmation(context).toString()),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(
//                       Icons.check_circle_outline,
//                       color: Theme.of(context).accentColor,
//                       size: 80.0,
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Text(
//                       S.orderHasBeenSubmitted(context),
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Text(
//                       S.orderSubmit(context),
//                       style: TextStyle(
//                         fontSize: 18.0,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(10.0),
//                       decoration:
//                           BoxDecoration(color: Colors.black.withOpacity(0.1)),
//                       child: Column(
//                         children: <Widget>[
//                           BuildTextRowWidget(
//                             title: S.subTotal(context),
//                             subTitle: subTotal,
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           BuildTextRowWidget(
//                             title: S.shippingFee(context),
//                             subTitle: shippingFee,
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           BuildTextRowWidget(
//                             title: S.discount(context),
//                             subTitle: discount,
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           BuildTextRowWidget(
//                             title: S.total(context),
//                             subTitle: total,
//                             textStyle: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 15.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.95,
//               child: FlatButton(
//                 onPressed: () => Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (_) => Home()),
//                     (route) => false),
//                 child: Text(
//                   S.continueShopping(context),
//                   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//                 ),
//                 color: Theme.of(context).accentColor,
//                 textColor: Theme.of(context).primaryColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   OrderSubmit(
//       {this.subTotal = 0,
//       this.shippingFee = 0,
//       this.discount = 0,
//       this.total = 0});
// }
//
// class BuildTextRowWidget extends StatefulWidget {
//   BuildTextRowWidget(
//       {@required this.title,
//       @required this.subTitle,
//       this.negative = '',
//       this.textStyle = const TextStyle(fontSize: 14.0)});
//   final String negative;
//   final String title;
//   final double subTitle;
//   final TextStyle textStyle;
//
//   @override
//   _BuildTextRowWidgetState createState() => _BuildTextRowWidgetState();
// }
//
// class _BuildTextRowWidgetState extends State<BuildTextRowWidget> {
//   @override
//   void initState() {
//     Timer(Duration(milliseconds: 300), () {
//       Provider.of<UserDataProvider>(context, listen: false).trashCoupon();
//       Provider.of<CartProvider>(context, listen: false).clearAll();
//       Provider.of<OrdersProvider>(context, listen: false).clearCached();
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Text(
//           widget.title,
//           style: widget.textStyle,
//         ),
//         Helper.getPrice(
//           widget.subTitle,
//           context,
//           style:
//               widget.textStyle.copyWith(color: Theme.of(context).accentColor),
//         ),
//       ],
//     );
//   }
// }
