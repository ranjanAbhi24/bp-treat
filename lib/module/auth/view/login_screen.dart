import 'package:bp_treat/module/auth/controller/login_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/size.dart';
import '../widget/common_elevated_button.dart';
import '../widget/email_form_field.dart';
import '../widget/password_form_field.dart';
import 'forgot_password_view.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
            Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller){
              return SingleChildScrollView(
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
                      SizedBox(height: 30.h),
                      Image.asset(
                        "assets/images/app_icon2.png",
                          height: 90.h,
                          width: 100.w
                      ),
                      Text("Log in to BP Treat",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 25.sp
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text("Log in with email and password you associated with your account",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            color: kBlackColor?.withOpacity(0.8)
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Form(
                          key: controller.loginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",

                                    style: Theme.of(context).textTheme.headline2,
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 250.w,
                                    child: EmailFormField(
                                      controller: controller.emailController,
                                    ),
                                  ),
                                ],
                              ),

                               SizedBox(height: 30.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Password",
                                    style: Theme.of(context).textTheme.headline2,
                                  ),
                                   SizedBox(height: 10.h),
                                  SizedBox(
                                    width: 250.w,
                                    child: PasswordFormField(
                                      controller: controller.passwordController,
                                      isObsecure: controller.isObsecure,
                                      onTap: controller.showPassword,
                                    ),
                                  ),
                                ],
                              ),

                               SizedBox(height: 40.h),
                              Align(
                                alignment: Alignment.center,
                                child: Text("Did you forgot your email?",
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: kBlackColor

                                    )
                                ),
                              ),
                             SizedBox(height: 20.h),
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(() => const ForgotPasswordView());
                                  },
                                  child: Text("Did you forgot your password?",
                                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: kBlackColor

                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 200.w,
                                   child: CommonElevatedButton(
                                    title: 'Log In',
                                    onTap: () async {
                                      if (controller.loginFormKey.currentState!.validate()) {
                                        EasyLoading.show(status: 'Sign In');
                                        await controller.login();
                                        EasyLoading.dismiss();
                                      }
                                    }, backgroundColor: kPrimaryColor, textColor: kWhiteColor,
                                  ),
                                ),
                              ),

                            ],
                          )
                      )
                    ],
                  ),
                ),
              );
            },
      ),
    )

    );
  }
}
