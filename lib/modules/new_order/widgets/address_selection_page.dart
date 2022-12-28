import 'package:deliveryapp/modules/constants.dart';
import 'package:deliveryapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class AddressSelection extends StatefulWidget {
  String locationPassed;
  AddressSelection({super.key, required this.locationPassed});

  @override
  State<AddressSelection> createState() => _AddressSelectionState();
}

class _AddressSelectionState extends State<AddressSelection> {
  TextEditingController selectedAddressController = TextEditingController();
  String selectedLocation = '';
  double latitude = 0;
  double longitude = 0;
  String selectedAddress = '';

  @override
  void initState() {
    super.initState();
  }

  void updateLocation(Map<String, String> location) async {
    print('location passed inside update location ----$location');
    latitude = double.parse(location['latitude']!);
    longitude = double.parse(location['longitude']!);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    String address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print('address from latitude longitude $address');

    setState(() {
      selectedAddress = address;
      selectedAddressController.text = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    setState(() {
      if (arguments['addressPassed'] != null &&
          arguments['addressPassed'] != '') {
        selectedAddressController.text = arguments['addressPassed'];
      }
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          'Address selection',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, selectedAddress);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.45,
                    child: CustomTextfield(
                      hint: 'Address Selected',
                      controller: selectedAddressController,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.grey.shade400,
                        width: 25,
                        indent: 15,
                        thickness: 1.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Map<String, String> location =
                            await Navigator.pushNamed(context, 'mapScreen')
                                as Map<String, String>;

                        updateLocation(location);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: blueColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Map',
                            style: TextStyle(
                                color: blueColor, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            child: Divider(
              color: Colors.grey.shade300,
              // indent: 15,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
