import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class find_Nearest_Synagogues extends StatefulWidget {
  Position position;

  find_Nearest_Synagogues({
    Key key,
    @required this.position,
  }) : super(key: key);

  @override
  _find_Nearest_SynagoguesState createState() =>
      _find_Nearest_SynagoguesState();
}

class _find_Nearest_SynagoguesState extends State<find_Nearest_Synagogues> {
  final Geolocator geolocator = Geolocator();

  Position currentPosition;
  String currentAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LAT: ${widget.position.latitude}, LNG: ${widget.position.longitude}",
            )
            // if (currentPosition != null)
            //   Text(
            //     "LAT: ${currentPosition.latitude}, LNG: ${currentPosition.longitude}",
            //   )
            // else
            //   getCurrentLocation()
          ],
        ),
      ),
    );
  }

  // getCurrentLocation() {
  //   //final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  //   Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //       .then((Position position) {
  //     setState(() {
  //       currentPosition = position;
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  // getAddressFromLatLng() async {
  //   try {
  //     List<Placemark> p = await geolocator.placemarkFromCoordinates(
  //         currentPosition.latitude, currentPosition.longitude);

  //     Placemark place = p[0];

  //     setState(() {
  //       currentAddress =
  //           "${place.locality}, ${place.postalCode}, ${place.country}";
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
