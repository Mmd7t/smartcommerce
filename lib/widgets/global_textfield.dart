import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';

class GlobalTextField extends StatelessWidget {
  final bool obscure;
  final String hint;
  final Widget suffixIcon;
  final IconData prefixIcon;
  final String label;
  final Function validator;
  final Function onSaved;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  GlobalTextField({
    Key key,
    this.obscure,
    this.hint,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    @required this.prefixIcon,
    this.label,
    this.textInputType,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();
    return Obx(
      () => TextFormField(
        obscureText: obscure ?? false,
        keyboardType: textInputType ?? TextInputType.text,
        textInputAction: textInputAction ?? TextInputAction.done,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          fillColor: Color(appController.primaryColor.value).withOpacity(0.15),
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon:
              Icon(prefixIcon, color: Color(appController.primaryColor.value)),
          suffixIcon: suffixIcon ?? const SizedBox(),
        ),
        validator: (value) {
          return validator(value);
        },
        onSaved: (newValue) => onSaved(newValue),
      ),
    );
  }
}
