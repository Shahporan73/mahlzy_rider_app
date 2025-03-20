import 'package:flutter/material.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';

class OrderDetailsWidget extends StatelessWidget {
  final bool? isComplete;
  const OrderDetailsWidget({super.key, this.isComplete =false});

  @override
  Widget build(BuildContext context) {
    String image = 'https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/1:1/w_2560%2Cc_limit/Smashburger-recipe-120219.jpg';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: 'Restaurant Address', fontWeight: FontWeight.w500,),
                  CustomText(title: 'Schrannenstraße'),
                  CustomText(title: '85049 Ingolstadt, Germany'),
                ],
              ),),
              Expanded(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(image),
                ),
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: 'Delivery Address', fontWeight: FontWeight.w500,),
                  CustomText(title: 'Bezirkssportanlage'),
                  CustomText(title: 'Englschalking'),
                ],
              ),),
            ],
          ),

          heightBox10,
          _itemWidget(quantity: '1', title: 'Chicken Boti Kebab', price: '23.65'),
          heightBox5,
          _itemWidget(quantity: '2', title: 'Chicken Boti Kebab', price: '23.65'),
          heightBox5,
          _itemWidget(quantity: '3', title: 'Chicken Boti Kebab', price: '23.65'),
          Divider(height: 10, color: Colors.grey,),
          Row(
            children: [
              CustomText(title: 'Payment Method', fontWeight: FontWeight.w600, fontSize: 14,),
              Spacer(),
              CustomText(title: 'Status', fontWeight: FontWeight.w600, fontSize: 14,),
            ],
          ),
          heightBox8,
          Row(
            children: [
              Image.asset(AppImages.cashIcon, height: 20, width: 20,),
              widthBox5,
              CustomText(title: 'Cash', fontWeight: FontWeight.w500, fontSize: 14,),
              Spacer(),
              CustomText(title: 'Unpaid', fontWeight: FontWeight.w500, fontSize: 14,),
            ],
          ),
          Divider(height: 10, color: Colors.grey,),

          Row(
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: 'Delivery Price', fontWeight: FontWeight.w600, fontSize: 14,),
                CustomText(title: '€ 6.39', fontWeight: FontWeight.w600, fontSize: 12,),
              ],
            ),
            Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: 'Delivery Price', fontWeight: FontWeight.w600, fontSize: 14,),
                  CustomText(title: '€ 6.39', fontWeight: FontWeight.w600, fontSize: 12,),
                ],
              )
            ],
          ),

          heightBox8,

          isComplete==true? Container():Row(
            children: [
              Expanded(
                flex: 5,
                  child: CustomButton(
                  title: 'Accept',
                  padding_vertical: 5,
                  buttonColor: Color(0xff2A9555),
                  titleColor: Colors.white,
                  onTap: (){}
              )),
              Expanded( flex: 8,
                  child: Container()),
              Expanded(
                flex: 5,
                child: CustomButton(
                  title: 'Cancel',
                  padding_vertical: 5,
                  onTap: (){}
              ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _itemWidget({required String quantity, required String title, required String price}){
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8)
          ),
          child: CustomText(title: '${quantity}x'),
        ),
        widthBox8,
        CustomText(title: title, fontWeight: FontWeight.w500, fontSize: 14,),
        Spacer(),
        CustomText(title: '€ $price', fontWeight: FontWeight.w500, fontSize: 14,)
      ],
    );
  }
}
