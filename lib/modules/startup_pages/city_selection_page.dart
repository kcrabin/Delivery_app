import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CitySelectionPage extends StatefulWidget {
  const CitySelectionPage({super.key});

  @override
  State<CitySelectionPage> createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  List<String> cities = [
    'City 1',
    'City 2',
    'City 3',
    'City 4',
    'City 5',
    'City 6',
    'City 7',
    'City 8',
    'City 9',
    'City 10',
    'City 11',
    'City 12',
    'City 13',
    'City 14',
    'City 15',
    'City 16'
  ];
  String citySelected = '';
  String countrySelected = '';

  void getDataFromSharedpref() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    print('this id shared pref ---${pref.getString('country')}');
    setState(() {
      countrySelected = pref.getString('country') ?? '🇳🇵 Nepal';
    });
  }

  // @override
  // void initState() {
  //   getDataFromSharedpref();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;
    // setState(() {
    //   countrySelected = arguments['countrySelected'];
    // });
    // String tempCountrySelected = SPUtil.read(ConstantsStrings.name);
    // print(tempCountrySelected);
    getDataFromSharedpref();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select city',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'countryListScreen');
              },
              child: Text(
                countrySelected,
                style: TextStyle(fontSize: 16, color: blueColor),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    citySelected = cities[index];
                  });
                  Navigator.pushNamed(context, 'introductionScreen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cities[index],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    citySelected == cities[index]
                        ? Icon(
                            Icons.done,
                            color: Colors.red,
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
