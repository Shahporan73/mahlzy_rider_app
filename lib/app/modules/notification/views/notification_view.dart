import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_app_bar.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notification'),
      body:SingleChildScrollView(
        padding: bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    // color: Colors.green,
                    width:Get.width/2.5,
                    child: Row(
                      children: [
                        CircleAvatar(radius: 5, backgroundColor: AppColors.mainColor,),
                        widthBox5,
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xffE8EBF0),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: AppColors.mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  title: CustomText(
                    title: 'Welcome, Your account has been created successfully.',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  subtitle: CustomText(
                    title: '1 day ago',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
