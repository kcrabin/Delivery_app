import 'package:deliveryapp/modules/authentication/login/widgets/person_login_page.dart';
import 'package:deliveryapp/modules/authentication/login/widgets/store_login_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PageController _pageController = PageController(initialPage: 0);
  bool passToggle = true;
  bool optionPerson = true;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        title: Text(
          'Sign in',
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      optionPerson = true;
                    });
                    _pageController.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: optionPerson == true
                            ? Colors.grey.shade200
                            : Colors.white),
                    child: Text(
                      'Person',
                      style: TextStyle(
                          color:
                              optionPerson == true ? Colors.black : Colors.grey,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      optionPerson = false;
                    });
                    _pageController.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: optionPerson == false
                            ? Colors.grey.shade200
                            : Colors.white),
                    child: Text(
                      'Store',
                      style: TextStyle(
                          color: optionPerson == false
                              ? Colors.black
                              : Colors.grey,
                          fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return PersonLoginPage();
                } else {
                  return StoreLoginPage();
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
