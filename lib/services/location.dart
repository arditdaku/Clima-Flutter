
import 'package:geolocator/geolocator.dart';

class Localtion {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    // this lets the task to happen in backgorund

    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
