import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/address_provider.dart';
import 'package:smartcommerce/models/address.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';

class NewShippingAddress extends StatefulWidget {
  static const String routeName = 'NewShippingAddress';

  @override
  _NewShippingAddressState createState() => _NewShippingAddressState();
}

class _NewShippingAddressState extends State<NewShippingAddress> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final _codeController = TextEditingController();
  final _cityFocusNode = FocusNode();
  final _addressLineFocusNode = FocusNode();
  final _houseNumberFocusNode = FocusNode();
  final _zipCodeFocusNode = FocusNode();
  String _phoneNumber;
  String _city;
  String _addressLine;
  String _houseNumber;
  String _zipCode;

  bool isLoading = false;

  void _saveForm() async {
    final _formData = _formState.currentState;
    if (_formData.validate()) {
      _formData.save();
      //TODO OTP here
      // print(_phoneNumber);
      // bool confirmOTP = await loginUser(phone: _phoneNumber, context: context);
      // if (confirmOTP) {
      setState(() {
        isLoading = true;
      });

      Get.put(AddressController()).addAddress(
        Address(
          city: _city,
          addressLine: _addressLine,
          phoneNumber: _phoneNumber,
          houseNumber: _houseNumber,
          zipCode: _zipCode,
        ),
      );
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pop();
      _formData.reset();
      // } else {
      //   //TODO try confirm otp
      // }
    }
  }

  @override
  void dispose() {
    _cityFocusNode.dispose();
    _addressLineFocusNode.dispose();
    _houseNumberFocusNode.dispose();
    _zipCodeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: GlobalAppBar(
        title: "new shipping".tr,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.all(14.0),
              child: Form(
                key: _formState,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          //phone number
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "phoneNumber".tr,
                              labelStyle: TextStyle(color: Colors.black45),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_cityFocusNode),
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (!GetUtils.isPhoneNumber("+2" + val)) {
                                return "phoneValid".tr;
                              } else
                                return null;
                            },
                            onSaved: (val) => _phoneNumber = '+2${val.trim()}',
                          ),
                          SizedBox(height: 20.0),
                          //city
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "city".tr,
                              labelStyle: TextStyle(color: Colors.black45),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            focusNode: _cityFocusNode,
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_addressLineFocusNode),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "cityValid".tr;
                              } else {
                                return null;
                              }
                            },
                            onSaved: (val) => _city = val,
                          ),
                          SizedBox(height: 20.0),

                          //addressLine
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "addressLine".tr,
                              labelStyle: TextStyle(color: Colors.black45),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            focusNode: _addressLineFocusNode,
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_houseNumberFocusNode),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "addressValid".tr;
                              } else
                                return null;
                            },
                            onSaved: (val) => _addressLine = val,
                          ),
                          SizedBox(height: 20.0),

                          //houseNumber
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "houseNumber".tr,
                              labelStyle: TextStyle(color: Colors.black45),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            focusNode: _houseNumberFocusNode,
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_zipCodeFocusNode),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "houseValid".tr;
                              } else
                                return null;
                            },
                            onSaved: (val) => _houseNumber = val,
                          ),
                          SizedBox(height: 20.0),

                          //Zip Code
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "zipCode".tr,
                              labelStyle: TextStyle(color: Colors.black45),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                              ),
                            ),
                            textInputAction: TextInputAction.done,
                            focusNode: _zipCodeFocusNode,
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(FocusNode()),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "zipValid".tr;
                              } else
                                return null;
                            },
                            onSaved: (val) => _zipCode = val,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        child: Text("save".tr),
                        textColor: Theme.of(context).primaryColor,
                        color: Theme.of(context).accentColor,
                        onPressed: _saveForm,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
