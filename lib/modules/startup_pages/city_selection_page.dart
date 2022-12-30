import 'package:deliveryapp/modules/constants.dart';
import 'package:deliveryapp/widgets/sp_utils.dart';
import 'package:deliveryapp/widgets/storage.dart';
import 'package:flutter/material.dart';

class CitySelectionPage extends StatefulWidget {
  const CitySelectionPage({super.key});

  @override
  State<CitySelectionPage> createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  List<String> cities = [
    'Pokhara',
    'Kathmandu',
    'Butwal',
    'Biratnagar',
    'Lalitpur',
    'Birjung',
    'Bharatpur',
    'Dharan',
    'Janakpur',
    'Itahari',
    'Hetauda',
    'Bhaktapur',
    'Kritipur',
    'Illam',
    'Banepa',
  ];
  String citySelected = '';
  String countrySelected = '';

  @override
  Widget build(BuildContext context) {
    // final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;
    // setState(() {
    //   countrySelected = arguments['countrySelected'];
    // });
    String tempCountrySelected = SPUtil.read(ConstantsStrings.name);
    // print(tempCountrySelected);
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
              onTap: () {},
              child: Text(
                tempCountrySelected,
                style: TextStyle(fontSize: 16, color: Colors.red),
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
