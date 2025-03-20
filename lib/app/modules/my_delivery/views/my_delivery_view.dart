import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahlzy_rider_app/app/modules/home/widget/custom_app_bar.dart';
import 'package:mahlzy_rider_app/app/modules/home/widget/order_card_widget.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';
import '../../home/views/order_details_view.dart';
import '../../home/widget/order_details_widget.dart';
import '../controllers/my_delivery_controller.dart';

class MyDeliveryView extends GetView<MyDeliveryController> {
  const MyDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: DashboardAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Custom TabBar
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  tabs: const [
                    Tab(text: "Running"),
                    Tab(text: "Complete"),
                    Tab(text: "Cancelled"),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Tab Content
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(0.0),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(()=>OrderDetailsView(
                              isComplete: false,
                            ));
                          },
                          child: OrderCard(),
                        );
                      },
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.all(0.0),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(()=>OrderDetailsView(
                              isComplete: true,
                            ));
                          },
                          child: OrderCard(),
                        );
                      },
                    ),
                    _buildOrderList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderList() {
    return ListView.builder(
      padding: const EdgeInsets.all(0.0),
      itemCount: 6,
      itemBuilder: (context, index) {
        return OrderCard();
      },
    );
  }
}
