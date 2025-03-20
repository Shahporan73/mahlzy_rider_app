import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahlzy_rider_app/app/modules/earnings/widget/last_earing_card_widget.dart';
import 'package:mahlzy_rider_app/app/modules/earnings/widget/total_earning_widget.dart';
import 'package:mahlzy_rider_app/app/modules/home/widget/custom_app_bar.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';

import '../controllers/earnings_controller.dart';

class EarningsView extends GetView<EarningsController> {
  const EarningsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TotalEarningWidget(totalEarnings: '€ 2.000',),

            heightBox20,
            ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return LastEaringCardWidget(

                );
              },
            )


          ],
        ),
      ),
    );
  }
}
