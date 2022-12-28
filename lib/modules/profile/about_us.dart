import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_textbutton.dart';

class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/icon2.png',
                    height: 100,
                    color: blueColor,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'Borzo',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Version 1.75.1',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustonTextButton(
              name: 'Service information',
              onPressed: () {},
            ),
            CustonTextButton(
              name: 'Terms and conditions',
              onPressed: () {},
            ),
            CustonTextButton(
              name: 'Privacy policy',
              onPressed: () {},
            ),
            CustonTextButton(
                name: 'Report a problem',
                onPressed: () {
                  Navigator.pushNamed(context, 'reportProblemScreen');
                }),
          ],
        ),
      ),
    );
  }
}
