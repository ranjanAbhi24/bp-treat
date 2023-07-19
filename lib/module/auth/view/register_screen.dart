import 'package:bp_treat/module/auth/controller/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/show_snackbar.dart';
import '../../../utils/size.dart';
import '../widget/common_elevated_button.dart';
import '../widget/input_textfield.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
//
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body:
           GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller){
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom.h
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.h),
                        Image.asset(
                          "assets/images/app_icon2.png",
                            height: 90.h,
                            width: 100.w
                        ),
                        Text("Hello ${controller.firstName.text}!",
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 22.sp
                          ),
                        ),
                        Text("Let's create your account.",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                            fontSize: 14.sp
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Form(
                          key: controller.formKey,
                          child:  Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 250.w,
                                  child: InputTextField(
                                    text: "Email",
                                    controller: controller.emailController,
                                    inputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Required*';
                                      } else if (!GetUtils.isEmail(value)) {
                                        return 'Enter correct email address';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height:20.h,
                                ),
                                SizedBox(
                                  width: 250.w,
                                  child: InputTextField(
                                    text: "Password",
                                    controller:
                                    controller.passwordController,
                                    inputType: TextInputType.text,
                                    isVisible: controller.isObsecure,
                                    icon: controller.isObsecure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    onTap: controller.showPassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Required*';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  width: 250.w,
                                  child: InputTextField(
                                    text: "Confirm Password",
                                    controller: controller
                                        .confirmPasswordController,
                                    inputType: TextInputType.text,
                                    isVisible: controller.isObsecureCNF,
                                    icon: controller.isObsecureCNF
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    onTap: controller.showPasswordCNF,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Required*';
                                      } else if (value !=
                                          controller
                                              .passwordController.text) {
                                        return "Password did not match.Try Again";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        activeColor: kPrimaryColor,
                                        materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                        side: BorderSide(color: kBlackColor!.withOpacity(0.8), width: 2),
                                        checkColor: Colors.white,
                                        value: controller.isChecked,
                                        onChanged: controller.toggleCheckBox,
                                      ),
                                      SizedBox(
                                        width: 230.w,
                                        child: RichText(

                                            maxLines: 2,
                                            text: TextSpan(
                                                text: "I agree to",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                    fontSize: 12,
                                                    color:
                                                    kBlackColor?.withOpacity(0.8)),
                                                children: [
                                                  TextSpan(
                                                      text: "\tTerms and Conditions",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2
                                                          ?.copyWith(
                                                          decoration: TextDecoration.underline,
                                                          fontSize: 13,
                                                          color: kBlackColor?.withOpacity(0.8)
                                                      )
                                                  ),
                                                  TextSpan(
                                                      text: "\tand\t",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2
                                                          ?.copyWith(

                                                          fontSize: 12,
                                                          color: kBlackColor?.withOpacity(0.8)
                                                      )),
                                                  TextSpan(
                                                      recognizer: TapGestureRecognizer()
                                                        ..onTap = () {
                                                          launchUrl(
                                                              Uri.parse(
                                                                  'http://54.238.218.186/privacy-policy'),
                                                              mode: LaunchMode.platformDefault);
                                                        },
                                                      text: " Privacy Policy",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2
                                                          ?.copyWith(
                                                          decoration: TextDecoration.underline,
                                                          fontSize: 13,
                                                          color: kBlackColor?.withOpacity(0.8)
                                                      ))
                                                ])),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                SizedBox(
                                  width: 200.w,
                                   child: CommonElevatedButton(
                                    title: 'Continue',
                                    onTap: controller.isChecked == false
                                        ? () {
                                      ApplicationUtils.showSnackBar(
                                          titleText: 'Error',
                                          messageText:
                                          'Please accept our terms and Privacy Policy to continue.');
                                    }
                                        : () async {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        EasyLoading.show(status: 'Generating Otp...');
                                        await controller.sendOtp();
                                        EasyLoading.dismiss();
                                      }
                                    }, backgroundColor: kPrimaryColor, textColor: kWhiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )

    ));
  }
}
