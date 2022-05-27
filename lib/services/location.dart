import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitde;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await _determinePosition();
      latitude = position.latitude;
      longitde = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

Future<Position> _determinePosition() async {
  //bool serviceEnabled;
  LocationPermission permission;

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  return await Geolocator.getCurrentPosition();
}
