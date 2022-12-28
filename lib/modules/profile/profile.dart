import 'package:flutter/material.dart';

import '../constants.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white, actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Log out',
              style: TextStyle(color: blueColor, fontSize: 18),
            ))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Hello!',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'personalInformationScreen');
              },
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'aboutUsScreen');
              },
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'About',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              child: Text('Log in',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: blueColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  minimumSize: Size(double.infinity, 50)),
              onPressed: () {
                Navigator.pushNamed(context, 'loginScreen');
              },
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Create account',
                    style: TextStyle(color: blueColor, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
