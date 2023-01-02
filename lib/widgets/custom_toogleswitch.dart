import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomToogle extends StatelessWidget {
  String text;
  bool val;
  Function onchangedMethod;

  CustomToogle(
      {super.key,
      required this.text,
      required this.val,
      required this.onchangedMethod});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        // Spacer(),
        CupertinoSwitch(
            trackColor: Colors.grey[300],
            activeColor: blueColor,
            value: val,
            onChanged: (newValue) {
              onchangedMethod(newValue);
            })
      ],
    );
  }
}
