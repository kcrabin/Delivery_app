import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    setState(() {
      countrySelected = arguments['previouslySelectedCountry'];
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, countrySelected);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Choose your country',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: countries.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    countrySelected = countries[index];
                  });
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
