import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final Function validator;
  final Function saver;
  final bool obscure;
  final Widget suffix;
  final String label;
  final TextEditingController controller;
  final Function onTap;
  final String initial;
  final TextInputType keyboardType;
  final String hint;
  final EdgeInsetsGeometry padding;
  final Widget prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 10.0),
      child: TextFormField(
        controller: controller,
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        initialValue: initial,
        keyboardType: keyboardType,
        obscureText: obscure,
        onSaved: saver,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          contentPadding: padding,
          prefixIcon: prefixIcon,
          suffix: suffix,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          filled: true,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(30.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).errorColor),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }

  AppInput(
      {this.validator,
      this.saver,
      this.keyboardType,
      this.controller,
      this.padding,
      this.onTap,
      this.obscure = false,
      this.suffix,
      this.label,
      this.initial,
      this.hint,
      this.prefixIcon});
}
