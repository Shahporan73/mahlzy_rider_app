
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:mahlzy_rider_app/app/modules/login_in/views/login_in_view.dart';
import 'package:mahlzy_rider_app/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:mahlzy_rider_app/app/modules/sign_up/widget/custom_title_widget.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_app_bar.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_dotted_widget.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_radio_button.dart';
import 'package:mahlzy_rider_app/res/common_widget/image_picker_dialog.dart';
import 'package:mahlzy_rider_app/res/utils/date_picker_controller.dart';
import 'package:mahlzy_rider_app/res/utils/image_picker_controller.dart';
import '../../../../res/app_constant/import_list.dart';


class SignUpView extends GetView<SignUpController> {
  SignUpView({super.key});

  final ImagePickerController _imagePickerController = Get.put(ImagePickerController());
  final DatePickerController datePickerController = Get.put(DatePickerController());
  final CheckValidationController _validation = Get.put(CheckValidationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign Up',
        backgroundColor: AppColors.mainColor,
        leadingColor: Colors.white,
        titleColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomTitleWidget(
              title: 'Your Profile Photo',
              title2: '*',
            ),
            heightBox8,
            Center(
              child: _imagePickerController.selectedImagePath.value.isNotEmpty ?
              Image.file(File(
                _imagePickerController.selectedImagePath.value,
              ),
                width: Get.width / 3,
                height: Get.height / 6,
              ) :
              CustomDottedWidget(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ImagePickerDialog(
                        onImagePicked: (ImageSource source) {
                          _imagePickerController.profilePickImage(source);
                        },
                      );
                    },
                  );
                },
                containerWidth: Get.width / 3,
                containerHeight: Get.height / 6,
                centerWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 24,),
                    CustomText(title: 'Upload', fontWeight: FontWeight.w600, fontSize: 12,)
                  ],
                ),
              ),
            ),


            heightBox10,
            CustomTitleWidget(
              title: 'Name',
              title2: '*',
            ),
            heightBox8,
            RoundTextField(
              hint: 'Enter your full name',
              prefixIcon: Icon(Icons.person),
            ),


            heightBox10,
            CustomTitleWidget(
              title: 'Mobile Number',
              title2: '*',
            ),
            heightBox8,
            RoundTextField(
              hint: 'Enter your full name',
              prefixIcon: Icon(Icons.person),
            ),

            heightBox10,
            CustomTitleWidget(
              title: 'Gender',
              title2: '*',
            ),
            heightBox8,
            CustomRadioButton(
                options: ['Male', 'Female', 'Other'],
                selectedValue: _validation.selectedGander.value,
                onChanged: (value) {
                  _validation.toggleGender(value);
                }
            ),


            heightBox10,
            CustomTitleWidget(
              title: 'Personal Document',
              title2: '*',
            ),
            heightBox8,
            RoundTextField(
              hint: 'Passport',
              readOnly: true,
              suffixIcon: Icon(Icons.arrow_forward_ios, size: 16,),
            ),

            heightBox8,
            RoundTextField(
              hint: 'Enter passport number',
              readOnly: true,
              prefixIcon: Icon(Icons.confirmation_number_outlined),
            ),

            heightBox10,
            CustomTitleWidget(
              title: 'Upload Passport Image',
              title2: '*',
            ),
            heightBox8,
            Row(
              children: [
                Expanded(child: Center(
                  child: CustomDottedWidget(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ImagePickerDialog(
                            onImagePicked: (ImageSource source) {
                              _imagePickerController.profilePickImage(source);
                            },
                          );
                        },
                      );
                    },
                    containerWidth: Get.width,
                    containerHeight: Get.height / 6,
                    centerWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt_outlined, color: Colors.black, size: 24,),
                        CustomText(title: 'Upload', fontWeight: FontWeight.w600, fontSize: 12,)
                      ],
                    ),
                  ),
                ),),
                // Expanded(child: Center(
                //   child: CustomDottedWidget(
                //     containerWidth: Get.width / 4,
                //     containerHeight: Get.height / 8,
                //     centerWidget: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 24,),
                //         CustomText(title: 'Back', fontWeight: FontWeight.w600, fontSize: 12,)
                //       ],
                //     ),
                //   ),
                // ),),
              ],
            ),




            heightBox10,
            CustomTitleWidget(
              title: 'Birth Date',
              title2: '*',
            ),
            heightBox8,
            RoundTextField(
              controller: datePickerController.dateController,
              hint: 'Select your birth date',
              readOnly: true,
              suffixIcon: GestureDetector(
                onTap: () => datePickerController.selectDate(context),
                child: Icon(Icons.calendar_month_outlined),
              ),
            ),



            heightBox10,
            CustomTitleWidget(
              title: 'Address',
              title2: '*',
            ),
            heightBox8,
            RoundTextField(
              hint: 'Enter your present address',
              readOnly: true,
              prefixIcon: Icon(Icons.location_on_outlined),
            ),

            heightBox10,
            RoundTextField(
              hint: 'Enter your Permanent address',
              readOnly: true,
              prefixIcon: Icon(Icons.location_on_outlined),
            ),


            heightBox10,
            CustomTitleWidget(
              title: 'Select City',
              title2: '*',
            ),
            heightBox8,
            RoundTextField(
              hint: 'Munich',
              readOnly: true,
              suffixIcon: Icon(Icons.arrow_forward_ios, size: 16,),
            ),


            heightBox10,
            CustomTitleWidget(
              title: 'Vehicle Types',
              title2: '*',
            ),
            heightBox8,
            CustomRadioButton(
                options: ['Walker', 'Bike', 'Cycle'],
                selectedValue: _validation.selectedVehicle.value,
                onChanged: (value) {
                  _validation.toggleVehicle(value);
                }
            ),


            heightBox10,
            RoundTextField(
                controller: _validation.emailController,
                hint: 'Email',
                prefixIcon: Icon(Icons.email, size: 18,),
                onChanged: _validation.emailValidation,
                errorText: _validation.emailError.value.isEmpty?null:_validation.emailError.value
            ),
            heightBox10,
            RoundTextField(
                hint: 'Password',
                prefixIcon: Icon(Icons.lock, size: 18,),
                suffixIcon: IconButton(
                  icon: Icon(
                    size: 18,
                    _validation.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    _validation.togglePasswordVisibility();
                  },
                ),
                obscureText: !_validation.isPasswordVisible.value,
                onChanged: _validation.passwordValidation,
                errorText: _validation.passwordError.value.isEmpty?null:_validation.passwordError.value
            ),


            heightBox20,
            CustomButton(
              title: 'Sign in with email',
              onTap: () {
                // if(_validation.emailValidateLoginForm()){
                //   //   login
                //   // Get.offNamed('/dashboard');
                // }
                Get.toNamed('/email-verification');
              },),


            heightBox10,
            Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Get.to(()=>LoginInView());
                        },
                      ),
                    ]
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
