//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class CheckoutScreen extends StatefulWidget {
//   @override
//   _CheckoutScreenState createState() => _CheckoutScreenState();
// }
//
// class _CheckoutScreenState extends State<CheckoutScreen> {
//   @override
//   void initState() {
//     super.initState();
//     if (mounted)
//       Provider.of<UserDataProvider>(context, listen: false).trashCoupon();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer4<CartProvider, UserDataProvider, AppProvider,
//         AddressProvider>(builder: (context, cart, coupon, app, address, child) {
//       return WillPopScope(
//         onWillPop: () async {
//           return cart.sendingOrder == false;
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(S.orderConfirmation(context)),
//             centerTitle: true,
//             leading: IconButton(
//                 icon: ArrowBackIcon,
//                 onPressed: () => Navigator.of(context).pop()),
//           ),
//           body: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Stack(
//               children: [
//                 ListView(
//                   shrinkWrap: true,
//                   physics: ScrollPhysics(),
//                   padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
//                   children: [
//                     UserAddressDataWidget(),
//                     PaymentMethod(),
//                     ApplyCoupon(),
//                     ShoppingBag(
//                       shippingFee: Calculator.getShippingFees(
//                         freeShippingCoupon: coupon.selectedCoupon.freeShipping,
//                         total: cart.totalPrice,
//                         freeSippingEnabled: app.adsArea.freeShippingEnabled,
//                         freeShippingMinimum: app.adsArea.freeMinimumShipping,
//                         nonFreeShipping: app.adsArea.nonFreeShipping,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                   bottom: 1,
//                   left: 1,
//                   right: 1,
//                   child: Material(
//                     elevation: 20,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 '${S.total(context)}: ',
//                                 style: TextStyle(
//                                     color: Theme.of(context)
//                                         .accentColor
//                                         .withOpacity(0.8)),
//                               ),
//                               Helper.getPrice(
//                                 Calculator.getTotal(
//                                   freeShippingCoupon:
//                                       coupon.selectedCoupon.freeShipping,
//                                   discount: coupon.selectedCoupon.valueAmount,
//                                   total: cart.totalPrice,
//                                   freeSippingEnabled:
//                                       app.adsArea.freeShippingEnabled,
//                                   percentageDiscount:
//                                       coupon.selectedCoupon.isPercentage == 1,
//                                   freeShippingMinimum:
//                                       app.adsArea.freeMinimumShipping,
//                                   nonFreeShipping: app.adsArea.nonFreeShipping,
//                                 ),
//                                 context,
//                                 style: TextStyle(
//                                     color: Theme.of(context).accentColor),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.95,
//                             child: FlatButton(
//                               disabledColor: Theme.of(context)
//                                   .accentColor
//                                   .withOpacity(0.6),
//                               onPressed: cart.sendingOrder
//                                   ? null
//                                   : () async {
//                                       if (address.selectedAddress.id == 0) {
//                                         Helper.showToast(
//                                             S.selectAddressFirst(context),
//                                             context);
//                                         return;
//                                       } else {
//                                         bool result = await cart.sendOrder(
//                                           address.selectedAddress,
//                                           coupon.selectedCoupon,
//                                           coupon.userData,
//                                           Calculator.getShippingFees(
//                                             freeShippingCoupon: coupon
//                                                 .selectedCoupon.freeShipping,
//                                             total: cart.totalPrice,
//                                             freeSippingEnabled:
//                                                 app.adsArea.freeShippingEnabled,
//                                             freeShippingMinimum:
//                                                 app.adsArea.freeMinimumShipping,
//                                             nonFreeShipping:
//                                                 app.adsArea.nonFreeShipping,
//                                           ),
//                                           Calculator.getTotal(
//                                             freeShippingCoupon: coupon
//                                                 .selectedCoupon.freeShipping,
//                                             discount: coupon
//                                                 .selectedCoupon.valueAmount,
//                                             total: cart.totalPrice,
//                                             freeSippingEnabled:
//                                                 app.adsArea.freeShipp        Provider.of<UserDataProvider>(context, listen: false).trashCoupon();
// ingEnabled,
//                                             percentageDiscount: coupon
//                                                     .selectedCoupon
//                                                     .isPercentage ==
//                                                 1,
//                                             freeShippingMinimum:
//                                                 app.adsArea.freeMinimumShipping,
//                                             nonFreeShipping:
//                                                 app.adsArea.nonFreeShipping,
//                                           ),
//                                         );
//                                         if (result == true) {
//                                           Navigator.pushReplacement(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) => OrderSubmit(
//                                                 shippingFee:
//                                                     Calculator.getShippingFees(
//                                                   freeShippingCoupon: coupon
//                                                       .selectedCoupon
//                                                       .freeShipping,
//                                                   total: cart.totalPrice,
//                                                   freeSippingEnabled: app
//                                                       .adsArea
//                                                       .freeShippingEnabled,
//                                                   freeShippingMinimum: app
//                                                       .adsArea
//                                                       .freeMinimumShipping,
//                                                   nonFreeShipping: app
//                                                       .adsArea.nonFreeShipping,
//                                                 ),
//                                                 total: Calculator.getTotal(
//                                                   freeShippingCoupon: coupon
//                                                       .selectedCoupon
//                                                       .freeShipping,
//                                                   discount: coupon
//                                                       .selectedCoupon
//                                                       .valueAmount,
//                                                   total: cart.totalPrice,
//                                                   freeSippingEnabled: app
//                                                       .adsArea
//                                                       .freeShippingEnabled,
//                                                   percentageDiscount: coupon
//                                                           .selectedCoupon
//                                                           .isPercentage ==
//                                                       1,
//                                                   freeShippingMinimum: app
//                                                       .adsArea
//                                                       .freeMinimumShipping,
//                                                   nonFreeShipping: app
//                                                       .adsArea.nonFreeShipping,
//                                                 ),
//                                                 subTotal: cart.totalPrice,
//                                                 discount: coupon
//                                                     .selectedCoupon.valueAmount,
//                                               ),
//                                             ),
//                                           );
//                                         } else {
//                                           Helper.showToast(
//                                               S.sendOrderError(context),
//                                               context);
//                                         }
//                                       }
//                                     },
//                               child: cart.sendingOrder
//                                   ? circularProgress(Colors.white)
//                                   : Text(
//                                       '${S.confirm(context)}',
//                                       style: TextStyle(
//                                           color: Theme.of(context).primaryColor,
//                                           fontSize: 20.0,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                               color: Theme.of(context).accentColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
