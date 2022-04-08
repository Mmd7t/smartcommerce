import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final dynamic value;
  final List<String> dataSource;
  String textField;
  String valueField;
  final Function onChanged;
  final bool filled;
  final EdgeInsets contentPadding;
  final BuildContext context;

  DropDownFormField(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      bool autoValidate = false,
      this.titleText = 'Title',
      this.context,
      this.hintText = 'Select one option',
      this.required = false,
      this.value,
      this.dataSource,
      this.onChanged,
      this.filled = true,
      this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0)})
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.always,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    titleText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: contentPadding,
                      filled: false,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Get.theme.primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Get.theme.primaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        isExpanded: true,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        hint: Text(
                          hintText,
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        value: value == '' ? null : value,
                        onChanged: (dynamic newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        items: dataSource.map((item) {
                          return DropdownMenuItem<dynamic>(
                            value: item,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Container(
                                child: Text(
                                  item,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Get.theme.primaryColor,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: state.hasError ? 5.0 : 0.0),
                  Text(
                    state.hasError ? state.errorText : '',
                    style: TextStyle(
                        color: Colors.redAccent.shade700,
                        fontSize: state.hasError ? 12.0 : 0.0),
                  ),
                ],
              ),
            );
          },
        );
}
