import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsModel {

  late GoogleMapController mapController;

  final LatLng center = const LatLng(-22.22088674443065, -45.71672207807446);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

}
