import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double currentLatitude = 0, currentLongitude = 0;
  String selectedLocation = '';

  // getLocation() async {
  //   GeoCode geoCode = GeoCode();
  //   final address = await geoCode.reverseGeocoding(
  //       latitude: currentLatitude, longitude: currentLongitude);

  //   selectedLocation =
  //       "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          'Address on map',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                // getLocation();
                Navigator.of(context).pop({
                  'latitude': currentLatitude.toString(),
                  'longitude': currentLongitude.toString(),
                });
              },
              child: Text(
                'Done',
                style: TextStyle(color: blueColor, fontSize: 17),
              ))
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(28.209499, 83.959518),
              zoom: 14.4746,
            ),
            markers: Set.of([]),
            onCameraMove: (cameraPosition) {
              setState(() {
                currentLongitude = cameraPosition.target.longitude;
                currentLatitude = cameraPosition.target.latitude;
                // selectedLocation = cameraPosition.target;
              });
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              height: 75,
              width: MediaQuery.of(context).size.width / 1.1,
              color: Colors.white.withOpacity(0.5),
              child: Text(
                'Drag the map until the cursor points to the place where the courser should arrive.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.place,
                  color: blueColor,
                ),
                onPressed: () {},
              )),
          Positioned(
              bottom: 0,
              child: TextButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  height: 75,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white.withOpacity(0.5),
                  child: Text(
                    'Selected Location name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
