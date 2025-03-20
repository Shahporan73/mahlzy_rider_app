import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mahlzy_rider_app/app/modules/home/widget/custom_app_bar.dart';
import '../controllers/map_controller.dart';

class MapView extends StatelessWidget  {
  MapView({super.key});

  final MapController controller = Get.find<MapController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(),
      body: Stack(
        children: [
          Obx(() => GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.receiverLocation,
              zoom: 14,
            ),
            markers: controller.markers.toSet(),
            polylines: controller.polylines.toSet(),
            myLocationEnabled: true,
            onMapCreated: controller.onMapCreated,
          )),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                    "Distance: ${controller.distance.value.toStringAsFixed(2)} km",
                    style: const TextStyle(fontSize: 18),
                  )),
                  const Icon(Icons.directions_car, color: Colors.blue),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
