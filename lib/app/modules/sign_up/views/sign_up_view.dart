
import 'package:mahlzy_rider_app/app/modules/sign_up/controllers/sign_up_controller.dart';
import '../../../../res/app_constant/import_list.dart';


class SignUpView extends GetView<SignUpController> {
  SignUpView({super.key});

  final CheckValidationController _validation = Get.put(CheckValidationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: [
          SizedBox(
            height: Get.height / 18,
          ),
          Center(
            child: Image.asset(
                AppImages.splashLogo,
                height: Get.height / 6,
                width: Get.width / 2,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: ClipPath(
                clipper: CustomClipPathRadiusWidget(),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.only(
                    top: Get.height / 8,
                    left: 20,
                    right: 20,
                  ),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CustomText(title: 'Welcome our lovely driver', fontSize: 15, fontWeight: FontWeight.w800,),
                        ),
                        Center(
                          child: CustomText(title: 'You are our valuable driver', fontSize: 12, fontWeight: FontWeight.w500,),
                        ),


                        heightBox20,
                        Obx(() => RoundTextField(
                            controller: _validation.emailController,
                            hint: 'Email',
                            prefixIcon: Icon(Icons.email, size: 18,),
                            onChanged: _validation.emailValidation,
                            errorText: _validation.emailError.value.isEmpty?null:_validation.emailError.value
                        ),),
                        heightBox10,
                        Obx(()=> RoundTextField(
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
                        ),

                        heightBox10,
                        GestureDetector(
                          onTap: () {
                            // Get.to(()=> ForgotPasswordView());
                          },
                          child: CustomText(
                            title: 'Forgot Password?',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        heightBox20,
                        CustomButton(
                          title: 'Sign in with email',
                          onTap: () {
                            if(_validation.emailValidateLoginForm()){
                              //   login
                              // Get.offNamed('/dashboard');
                            }
                          },),


                      ],
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
