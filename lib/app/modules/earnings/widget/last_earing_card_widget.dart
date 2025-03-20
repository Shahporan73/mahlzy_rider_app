import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';

class LastEaringCardWidget extends StatelessWidget {
  const LastEaringCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xfff5d7d5),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.mainColor,
            ),
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          Expanded(
            flex: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: 'Order ID: sdf6546sd4f64f6iuhh',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                heightBox5,
                CustomText(
                  title: 'Earning amount: €6,00',
                  fontSize: 12,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: CustomText(
              title: '2 hours ago',
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
