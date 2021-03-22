import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

Future<void> getSynagogues(Position pos) async {
  int count = 1;
  FirebaseFirestore.instance
      .collection('Synagogues')
      .where('lat', isLessThanOrEqualTo: '${pos.latitude.toDouble() + 0.00500}')
      .where('lat',
          isGreaterThanOrEqualTo: '${pos.latitude.toDouble() - 0.00500}')
      .snapshots()
      .listen((data) => data.docs.forEach((doc) => isLessThen500m(
                  pos.latitude.toDouble(),
                  pos.longitude.toDouble(),
                  double.parse(doc["lat"]),
                  double.parse(doc["lon"])) ==
              true
          ? print(doc["name"] + " " + 'count = ${count++}')
          : null));
}

bool isLessThen500m(double ourLatitude, double ourLongitude,
    double destLatitude, double destLongitude) {
  double distanceInMeters = Geolocator.distanceBetween(
      ourLatitude, ourLongitude, destLatitude, destLongitude);
  if (distanceInMeters <= 500 && distanceInMeters >= 0)
    return true;
  else
    return false;
}


  /*
  Example for insert data to variable:
   your_async_method () async {

     final documents = await db.collection('users').where("email", isEqualTo: "jtent@mail.com").getDocuments();
     final userObject = documents.documents.first.data;
     print(userObject);
    }
   */

  // Query filteredCollection_1 = FirebaseFirestore.instance
  //     .collection('Synagogues')
  //     .where('lon',
  //         isLessThanOrEqualTo: '${pos.longitude.toDouble() + 0.00500}');
  // Query filteredCollection_2 = filteredCollection_1.where('lon',
  //     isGreaterThanOrEqualTo: '${pos.longitude.toDouble() - 0.00500}');
  // filteredCollection_2
  //     .where('lat', isLessThanOrEqualTo: '${pos.latitude.toDouble() + 0.00500}')
  //     .snapshots()
  //     .listen((data) => data.docs.forEach((doc) => print(doc["name"])));
  // Query filteredCollection_4 = filteredCollection_3.where('lat',
  //     isGreaterThanOrEqualTo: '${pos.latitude.toDouble() - 0.00500}');
  // //Now we print it:
  // filteredCollection_4
  //     .snapshots()
  //     .listen((data) => data.docs.forEach((doc) => print(doc["name"])));
