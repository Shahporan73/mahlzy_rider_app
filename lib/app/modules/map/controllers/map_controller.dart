import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:mahlzy_rider_app/app/data/end_point/app_api.dart';

import '../../../../res/app_constant/import_list.dart';

class MapController extends GetxController {
  GoogleMapController? mapController; // Nullable controller
  var currentPosition = Rxn<Position>();
  final LatLng receiverLocation = const LatLng(37.7749, -122.4194); // Example Receiver Location
  var markers = <Marker>{}.obs;
  var polylines = <Polyline>{}.obs;
  var routeCoords = <LatLng>[].obs;
  var distance = 0.0.obs;

  final String googleApiKey = "YOUR_GOOGLE_MAPS_API_KEY";

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) return;
      }

      Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 10,
        ),
      ).listen((Position position) {
        currentPosition.value = position;
        updateMarkers();
        updateDistance();
        drawRoute();
      });
    } catch (e) {
      print("Error fetching location: $e");
    }
  }

  void updateMarkers() {
    markers.clear();
    if (currentPosition.value != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('rider'),
          position: LatLng(currentPosition.value!.latitude, currentPosition.value!.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: const InfoWindow(title: "Rider"),
        ),
      );
      markers.add(
        Marker(
          markerId: const MarkerId('receiver'),
          position: receiverLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: const InfoWindow(title: "Receiver"),
        ),
      );
    }
  }

  Future<void> drawRoute() async {
    try {
      if (currentPosition.value == null) return;

      PolylinePoints polylinePoints = PolylinePoints();
      PolylineRequest request = PolylineRequest(
        origin: PointLatLng(currentPosition.value!.latitude, currentPosition.value!.longitude),
        destination: PointLatLng(receiverLocation.latitude, receiverLocation.longitude),
        transitMode: '',
        mode: TravelMode.driving,
      );

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(request: request);

      // Check if API request was successful
      if (result.status == "OK" && result.points.isNotEmpty) {
        routeCoords.clear();
        for (var point in result.points) {
          routeCoords.add(LatLng(point.latitude, point.longitude));
        }

        polylines.clear();
        polylines.add(
          Polyline(
            polylineId: const PolylineId("route"),
            color: const Color(0xFF2196F3),
            width: 5,
            points: routeCoords.toList(),
          ),
        );
      } else {
        print("Error: Polyline API response failed - ${result.errorMessage}");
      }
    } catch (e) {
      print("Error drawing route: $e");
    }
  }



  void updateDistance() {
    if (currentPosition.value != null) {
      distance.value = Geolocator.distanceBetween(
        currentPosition.value!.latitude,
        currentPosition.value!.longitude,
        receiverLocation.latitude,
        receiverLocation.longitude,
      ) /
          1000; // Convert meters to kilometers
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
