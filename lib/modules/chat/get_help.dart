import 'package:flutter/material.dart';

class GetHelp extends StatelessWidget {
  const GetHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'Get help',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'searchScreen');
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ]),
    );
  }
}
