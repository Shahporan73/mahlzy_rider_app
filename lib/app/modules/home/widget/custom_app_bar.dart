import 'package:flutter/material.dart';
import 'package:mahlzy_rider_app/res/app_color/app_colors.dart';
import 'package:mahlzy_rider_app/res/app_constant/cosnt_data.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_text.dart';

import '../../../../res/app_constant/import_list.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      title: CustomText(
        title: 'Hello Mr. Driver',
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications,
            size: 28,
            color: Colors.white,
          ),
          onPressed: () {
            // Handle notification icon tap
            Get.toNamed('/notification');
          },
        ),
        const CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(placeholderImage),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
