import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/pic2.png',
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            'It\'s affortable: pricing starts from ₹ 40',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            'Set addresses, picktime, and the app will calculate the delivery price.',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
