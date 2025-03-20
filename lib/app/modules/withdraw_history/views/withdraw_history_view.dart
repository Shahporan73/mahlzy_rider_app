import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahlzy_rider_app/res/app_color/app_colors.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_app_bar.dart';

import '../controllers/withdraw_history_controller.dart';

class WithdrawHistoryView extends GetView<WithdrawHistoryController> {
  const WithdrawHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Sample data for the table
    final List<Map<String, String>> paymentData = List.generate(8, (index) {
      return {
        'name': 'Chieko Chute-${index + 1}',
        'date': '2024-12-0${(index % 3) + 1}',
        'amount': '\$${(index + 1) * 100}',
      };
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "Withdraw History"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Add some space at the top
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: DataTable(
                  columnSpacing: 35.0,
                  headingRowColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.mainColor,
                  ),
                  headingTextStyle: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  dataTextStyle: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    color: AppColors.black,
                  ),
                  headingRowHeight: 40,
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: List.generate(
                    paymentData.length,
                        (index) {
                      final data = paymentData[index];
                      return DataRow(
                        cells: [
                          DataCell(Text(data['name']!)),
                          DataCell(Text(data['date']!)),
                          DataCell(Text(data['amount']!)),
                          DataCell(
                            Icon(Icons.visibility, size: 20),
                            onTap: () {
                              showDetailsDialog(context);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDetailsDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          ),
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        )
                      ),
                      child: Icon(Icons.close, color: AppColors.white,),
                    ),
                  )
                ],
              ),
             Padding(
               padding: EdgeInsets.all(12),
             child:  Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 _dialogItem(
                     'User ID:','#1234'
                 ),
                 _dialogItem(
                     'Email:','Brookl@gmail.com'
                 ),
                 _dialogItem(
                     'Trx ID:','#123456789'
                 ),
                 _dialogItem(
                     'Time & Date:','4:15 PM, 13/02/24'
                 ),
                 _dialogItem(
                     'Amount:','\$25.02'
                 ),
                 _dialogItem(
                     'Payment\nMethod:','Debit Card'
                 ),
                 _dialogItem(
                     'Subscription\nPackage:','Close Family'
                 ),
               ],
             ),
             ),
            ],
          ),
        );
      },
    );
  }

  Widget _dialogItem(title, value){
    return Row(
      children: [
        CustomText(
          title: title,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.black,
        ),
        Spacer(),
        CustomText(
          title: value,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.black,
        ),
      ],
    );
  }
}
