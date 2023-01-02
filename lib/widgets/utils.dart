import 'package:flutter/material.dart';

class Utils {
  static final messangerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text, Color color, double bottom) {
    if (text == null) return;
    final snackBar = SnackBar(
      margin: EdgeInsets.only(bottom: bottom, left: 10, right: 10),
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      content: Text(
        text,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      backgroundColor: color.withOpacity(0.4),
    );

    messangerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
