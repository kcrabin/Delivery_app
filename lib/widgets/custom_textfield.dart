import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  String hint;
  String? label;
  String? initialValue;

  IconData? suffixIcon;
  TextInputAction? inputAction;
  TextInputType? inputType;
  TextEditingController? controller;
  CustomTextfield(
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
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool hasData = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      controller: widget.controller,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
          errorText: hasData == false ? 'Mandatory field' : null,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: blueColor, width: 1),
          ),
          hintText: widget.hint,
          labelText: widget.label,
          hintStyle: TextStyle(fontSize: 17),
          suffixIcon: Icon(widget.suffixIcon)),
      onChanged: (value) {
        if (value.isEmpty) {
          setState(() {
            hasData = false;
          });
        } else {
          setState(() {
            hasData = true;
          });
        }
      },
    );
  }
}
