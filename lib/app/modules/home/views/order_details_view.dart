import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mahlzy_rider_app/app/modules/home/controllers/home_controller.dart';
import 'package:mahlzy_rider_app/app/modules/home/widget/order_details_widget.dart';
import 'package:mahlzy_rider_app/res/app_color/app_colors.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_text.dart';

class OrderDetailsView extends GetView {
  final bool? isComplete;
  const OrderDetailsView({super.key, this.isComplete =false, });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderDetailsView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [

          /// Google Map Widget
          Obx(() => GoogleMap(
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: CameraPosition(
              target: controller.initialPosition.value,
              zoom: 10.0,
            ),
            markers: controller.markers,
          ),),

          /// Bottom Order List
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height / 1.7,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: CustomText(
                      title: "Offer Orders",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OrderDetailsWidget(isComplete: isComplete,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
