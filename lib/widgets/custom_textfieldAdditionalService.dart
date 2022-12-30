import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/material.dart';

class CustomTextfieldAdditionalService extends StatelessWidget {
  String hint;
  String? label;
  String? initialValue;

  IconData? suffixIcon;
  TextInputAction? inputAction;
  TextInputType? inputType;
  TextEditingController? controller;
  CustomTextfieldAdditionalService(
      {Key? key,
      required this.hint,
      this.label,
      this.initialValue,
      this.suffixIcon,
      this.inputAction,
      this.inputType,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: inputAction,
      keyboardType: inputType,
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: blueColor, width: 1),
          ),
          hintText: hint,
          labelText: label,
          hintStyle: TextStyle(fontSize: 20),
          suffixIcon: Icon(suffixIcon)),
    );
  }
}
