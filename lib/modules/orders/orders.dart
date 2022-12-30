import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/material.dart';

import '../chat/chat.dart';
import '../new_order/new_order.dart';
import '../profile/profile.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int currentIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      // currentIndex = index;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewOrder()));
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
    } else if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile()));
    } else {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => Orders()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text('Orders')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              Image.asset(
                'assets/images/gift.png',
                height: 180,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Send a package',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "A courier will pick up and",
                style: TextStyle(fontSize: 17, color: Colors.grey[700]),
              ),
              Text(
                "deliver documents, gifts,",
                style: TextStyle(fontSize: 17, color: Colors.grey[700]),
              ),
              Text(
                "food and other items",
                style: TextStyle(fontSize: 17, color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                child: Text('Create order',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: blueColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width / 2, 55)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewOrder()));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'loginScreen');
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          fontSize: 17,
                          color: blueColor,
                          fontWeight: FontWeight.w600),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  Text(
                    ' or ',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'registerScreen');
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 17,
                          color: blueColor,
                          fontWeight: FontWeight.w600),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 5,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            // onTap: (index) => setState(() => currentIndex = index),
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
              _onItemTapped(currentIndex);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.folder,
                    size: 25,
                  ),
                  label: 'Orders'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
                    size: 27,
                  ),
                  label: 'New Order'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sms_outlined,
                    size: 27,
                  ),
                  label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_sharp,
                    size: 27,
                  ),
                  label: 'Profile'),
            ]),
      ),
    );
  }
}
