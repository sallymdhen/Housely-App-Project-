import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationData {
  static String selectedAddress =
      "Jl.Jend.Sudirman, Gowongan, Kec. Jetis, Kota Yogyakarta";

  static double? latitude;
  static double? longitude;

  static Future<String> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return selectedAddress;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return selectedAddress;
    }

    final Position position = await Geolocator.getCurrentPosition();

    latitude = position.latitude;
    longitude = position.longitude;

    final List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;

      selectedAddress =
          place.name ?? place.locality ?? place.country ?? selectedAddress;
    }

    return selectedAddress;
  }
}
