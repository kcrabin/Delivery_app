import 'dart:async';

import 'package:deliveryapp/modules/introduction_pages/widgets/page1.dart';
import 'package:deliveryapp/modules/introduction_pages/widgets/page2.dart';
import 'package:deliveryapp/modules/introduction_pages/widgets/page3.dart';
import 'package:deliveryapp/modules/orders/orders.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int _currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 15), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        _currentPage = 2;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Page1();
                  } else if (index == 1) {
                    return Page2();
                  } else {
                    return Page3();
                  }
                },
              ),
            ),
            _currentPage != 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageController.animateToPage(2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: ScrollingDotsEffect(
                            activeDotScale: 1,
                            activeDotColor: blueColor,
                            dotColor: Colors.grey.shade300,
                            dotWidth: 10,
                            dotHeight: 10),
                        onDotClicked: (index) => _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease),
                      ),
                      TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 700),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(color: blueColor, fontSize: 18),
                          ))
                    ],
                  )
                : ElevatedButton(
                    child: Text(
                      'Let\'s start!',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: blueColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50)),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Orders()),
                          (Route<dynamic> route) => false);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
