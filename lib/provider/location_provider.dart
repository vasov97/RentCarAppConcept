import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class LocationProvider with ChangeNotifier {
  LatLng? _latLng;

  LatLng? get latLng => _latLng;

  Future<void> getLatLng(String location) async {
    try {
      List<Location> locations = await locationFromAddress(location);
      _latLng = LatLng(locations[0].latitude, locations[0].longitude);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
