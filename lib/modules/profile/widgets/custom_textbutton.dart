import 'package:flutter/material.dart';

class CustonTextButton extends StatelessWidget {
  String name;
  final Function() onPressed;
  CustonTextButton({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(color: Colors.black, fontSize: 17),
      ),
    );
  }
}
