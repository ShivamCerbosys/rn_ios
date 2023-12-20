// import 'package:flutter/material.dart';
import 'package:location/location.dart' as location;
// import 'package:geocoding_platform_interface/src/models/location.dart' as geocoding;
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationStateProvider =
    StateNotifierProvider<LocationNotifier, LocationState>((ref) {
  return LocationNotifier();
});

class LocationState {
  final String address;

  LocationState({required this.address});
}

class LocationNotifier extends StateNotifier<LocationState> {
  final location.Location locationService = location.Location();

  LocationNotifier() : super(LocationState(address: "your address"));

  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        geocoding.Placemark firstPlacemark = placemarks.first;
        String address =
            "${firstPlacemark.street}, ${firstPlacemark.subLocality},${firstPlacemark.locality}, ${firstPlacemark.administrativeArea}";

        state = LocationState(address: address);
      } else {
        // Handle the case when no placemarks are available
        // You might want to update the state or show a dialog
      }
    } catch (e) {
      // Handle exceptions that may occur while getting the location
      // You might want to update the state or show a dialog
    }
  }

  Future<void> getCurrentLocation() async {
    location.LocationData locationData;
    try {
      locationData = await locationService.getLocation();
      await getAddressFromLatLng(
          locationData.latitude!, locationData.longitude!);
    } catch (e) {
      // Handle exceptions that may occur while getting the location
      // You might want to update the state or show a dialog
    }
  }
}
