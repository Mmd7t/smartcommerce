import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final bool obscure;
  final String hint;
  final Widget suffixIcon;
  final IconData prefixIcon;
  final String label;
  final Function validator;
  final Function onSaved;

  const GlobalTextField({
    Key key,
    this.obscure,
    this.hint,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    @required this.prefixIcon,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(prefixIcon, color: Theme.of(context).primaryColor),
        suffixIcon: suffixIcon ?? const SizedBox(),
      ),
      validator: (value) {
        return validator(value);
      },
      onSaved: (newValue) => onSaved(newValue),
    );
  }
}
