import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class NationalitySelectionPage extends StatefulWidget {
  const NationalitySelectionPage({super.key});

  @override
  State<NationalitySelectionPage> createState() =>
      _NationalitySelectionPageState();
}

class _NationalitySelectionPageState extends State<NationalitySelectionPage> {
  String country = '🇳🇵 Nepal';

  void getDataFromSharedpref() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    print('this id shared pref ---${pref.getString('country')}');
    setState(() {
      if (pref.getString('country') != '' ||
          pref.getString('country') != null) {
        country = pref.getString('country') ?? '🇳🇵 Nepal';
      } else {
        country = '🇳🇵 Nepal';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getDataFromSharedpref();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Image.asset(
              'assets/images/borzo_logo.png',
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Spacer(),
            Text(
              'Welcome to Borzo!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'countryListScreen',
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    // alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black),
                    child: Row(
                      children: [
                        Text(
                          'Are you in ',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          '$country ?',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.expand_more,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                // Spacer(),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            ElevatedButton(
              child: Text('Yes',
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
                Navigator.pushNamed(context, 'citySelectionScreen',
                    arguments: {'countrySelected': country});
              },
            ),
          ],
        ),
      ),
    );
  }
}
