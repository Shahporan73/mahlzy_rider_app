import 'package:flutter/material.dart';
import 'package:mahlzy_rider_app/app/modules/home/controllers/home_controller.dart';
import 'package:mahlzy_rider_app/res/app_color/app_colors.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_text.dart';

/// Order Card Widget
class OrderCard extends StatelessWidget {

  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image = 'https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/1:1/w_2560%2Cc_limit/Smashburger-recipe-120219.jpg';
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ]
        ),
        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Expanded(
            flex: 8,
            child: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(image), // Update with your asset
            ),
          ),
          widthBox8,
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    title: 'Delivery Address',
                    fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                CustomText(
                    title: 'Bezirkssportanlage Englschalking',
                  fontSize: 10,
                ),
              ],
            ),
          ),
          widthBox5,
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    title: "Food Price",
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),
                CustomText(title: "€ 66.39", fontSize: 14),
              ],
            ),
          ),
          widthBox5,
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    title: "Delivery Price",
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                CustomText(title: "€ 6.39", fontSize: 14),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//ListTile(
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage(image), // Update with your asset
//           ),
//           title: CustomText(
//             title: order.deliveryAddress,
//             fontWeight: FontWeight.bold,
//           ),
//           subtitle: CustomText(title: order.location),
//           trailing: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomText(title: "Food Price", fontSize: 12, fontWeight: FontWeight.bold),
//               CustomText(title: "€ ${order.foodPrice}", fontSize: 14),
//               SizedBox(height: 5),
//               CustomText(title: "Delivery Price", fontSize: 12, fontWeight: FontWeight.bold),
//               CustomText(title: "€ ${order.deliveryPrice}", fontSize: 14),
//             ],
//           ),
//         ),
