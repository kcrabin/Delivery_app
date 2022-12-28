import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String hint;
  String? label;

  IconData? suffixIcon;
  TextInputAction? inputAction;
  TextInputType? inputType;
  TextEditingController? controller;
  CustomTextfield(
      {Key? key,
      required this.hint,
      this.label,
      this.suffixIcon,
      this.inputAction,
      this.inputType,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: inputAction,
      keyboardType: inputType,
      controller: controller,
      // controller: this._emailController,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: blueColor, width: 1),
          ),

          // hintText: "Enter your email",
          hintText: hint,
          labelText: label,
          hintStyle: TextStyle(fontSize: 20),
          suffixIcon: Icon(suffixIcon)),
    );
  }
}
