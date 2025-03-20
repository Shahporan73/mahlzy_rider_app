import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahlzy_rider_app/app/modules/earnings/views/earnings_view.dart';
import 'package:mahlzy_rider_app/app/modules/home/views/home_view.dart';
import 'package:mahlzy_rider_app/app/modules/map/views/map_view.dart';
import 'package:mahlzy_rider_app/app/modules/my_delivery/views/my_delivery_view.dart';
import 'package:mahlzy_rider_app/app/modules/profile/views/profile_view.dart';
import 'package:mahlzy_rider_app/res/app_color/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          body: getSelectedScreen(controller.selectedIndex),
          bottomNavigationBar: CustomBottomNavBar(controller: controller),
        );
      },
    );
  }

  /// Returns the screen based on the selected tab index.
  Widget getSelectedScreen(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const MyDeliveryView();
      case 2:
        return MapView(); // Center "Map" button screen
      case 3:
        return const EarningsView();
      case 4:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final DashboardController controller;

  const CustomBottomNavBar({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: buildNavItem(Icons.home, "Home".tr, 0)),
              Expanded(child: buildNavItem(Icons.local_shipping, "My Delivery".tr, 1)),
              const SizedBox(width: 60), // Space for the centered button
              Expanded(child: buildNavItem(Icons.attach_money, "Earnings".tr, 3)),
              Expanded(child: buildNavItem(Icons.person, "Profile".tr, 4)),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 35, // Center horizontally
          child: InkWell(
            onTap: () => controller.changePage(2),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.mainColor, // Inner color for the button
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xffFFA9A9), width: 5),
                ),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    final isSelected = controller.selectedIndex == index;
    return InkWell(
      onTap: () => controller.changePage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? AppColors.mainColor : Colors.grey, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: isSelected ? AppColors.mainColor : const Color(0xff9DB2CE),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
