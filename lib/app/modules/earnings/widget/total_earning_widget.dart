import 'package:flutter/material.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';

class TotalEarningWidget extends StatelessWidget {
  final String totalEarnings;
  const TotalEarningWidget({super.key, required this.totalEarnings});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          CustomText(
            title: totalEarnings,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
          CustomText(
            title: 'Total Earnings',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
