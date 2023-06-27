import 'package:bp_treat/module/auth/controller/login_controller.dart';
import 'package:bp_treat/module/auth/view/forgot_password_view.dart';
import 'package:bp_treat/module/auth/view/register_screen.dart';
import 'package:bp_treat/module/auth/widget/email_form_field.dart';
import 'package:bp_treat/module/auth/widget/password_form_field.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../widget/common_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Image.asset(
                      "assets/images/app_logo.png",
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                    ),
                    SizedBox(height: size.height * 0.06),
                    Form(
                      key: controller.loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email*",
                          ),
                          const SizedBox(height: 10),
                          EmailFormField(
                            controller: controller.emailController,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Password*",
                          ),
                          const SizedBox(height: 10),
                          PasswordFormField(
                            controller: controller.passwordController,
                            isObsecure: controller.isObsecure,
                            onTap: controller.showPassword,
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Get.to(() => const ForgotPasswordView());
                                },
                                child: const Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.06),
                    CommonElevatedButton(
                      title: 'Sign In',
                      onTap: () async {
                        if (controller.loginFormKey.currentState!.validate()) {
                          EasyLoading.show(status: 'Sign In');
                          await controller.login();
                          EasyLoading.dismiss();
                        }
                      },
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                      text: TextSpan(
                          text: "Don’t have an account?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: kBlackColor?.withOpacity(0.8)),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.off(() => const RegisterScreen());
                                  },
                                text: ' Register',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontSize: 15, color: kPrimaryColor))
                          ]),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
