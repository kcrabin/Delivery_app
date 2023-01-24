import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  List<String> countries = [
    '🇳🇵 Nepal',
    '🇮🇳 India',
    '🇧🇷 Brazil',
    '🇮🇩 Indonesia',
    '🇲🇾 Malaysia',
    '🇲🇽 Mexico',
    '🇵🇭 Philippines',
    '🇰🇷 South Korea',
    '🇻🇳 Vietnam'
  ];

  String countrySelected = '🇳🇵 Nepal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
          'Choose your country',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: countries.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: GestureDetector(
                onTap: () async {
                  final SharedPreferences pref =
                      await SharedPreferences.getInstance();

                  setState(() {
                    countrySelected = countries[index];
                    pref.setString('country', countrySelected);
                  });

                  print('this id shared pref ---${pref.getString('country')}');

                  Navigator.pop(context, countrySelected);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      countries[index],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    countrySelected == countries[index]
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
