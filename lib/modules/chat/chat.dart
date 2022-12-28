import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        TweenAnimationBuilder(
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: blueColor,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  color: Colors.white,
                )
              ],
            ),
          ),
          duration: Duration(milliseconds: 700),
          curve: Curves.easeIn,
          tween: Tween(begin: 4, end: 0.0),
          builder: (context, value, child) {
            // horizontal disposition of the widget.
            return Transform.translate(
              offset: Offset(0, value * 500),
              child: child,
            );
          },
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.06,
          right: MediaQuery.of(context).size.width * 0.02,
          left: MediaQuery.of(context).size.width * 0.05,
          child: TweenAnimationBuilder(
            child: SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/icon2.png',
                          color: Colors.white,
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    Text.rich(TextSpan(
                        text: 'Hi from Borzo 👋',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                    Text(
                      'Ask us anything',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            duration: Duration(milliseconds: 1200),
            curve: Curves.easeIn,
            tween: Tween(begin: -2.0, end: 0.0),
            builder: (context, value, child) {
              // horizontal disposition of the widget.
              return Transform.translate(
                offset: Offset(value * 500, 0.0),
                child: child,
              );
            },
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.26,
          right: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          child: TweenAnimationBuilder(
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6,
                    )
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get help',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'getHelp');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: blueColor, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              Icons.search,
                              color: blueColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Search articles...',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'The team can help if needed',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            duration: Duration(milliseconds: 2000),
            curve: Curves.easeIn,
            tween: Tween(begin: -4.0, end: 0.0),
            builder: (context, value, child) {
              // horizontal disposition of the widget.
              return Transform.translate(
                offset: Offset(value * 500, 0.0),
                child: child,
              );
            },
          ),
        )
      ]),
      // body:
    );
  }
}
