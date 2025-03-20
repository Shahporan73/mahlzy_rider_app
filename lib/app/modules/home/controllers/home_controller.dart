import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  var initialPosition = LatLng(48.7665, 11.4257).obs;
  var markers = <Marker>{}.obs;

  void onMapCreated(GoogleMapController controller) {
    // Store the controller if needed
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
