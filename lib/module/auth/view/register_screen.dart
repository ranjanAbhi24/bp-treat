import 'package:bp_treat/module/auth/controller/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller){
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.06),
                    Image.asset(
                      "assets/images/app_icon2.png",
                      height: size.height * 0.1,
                      width: size.width * 0.4,
                    ),
                    Text("Hello Rebecca!",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text("Let's create your account.",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.06,
                    ),
                    Form(
                      key: controller.formKey,
                      child:  Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size.width * 0.7,
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
                              height: size.height*0.02,
                            ),
                            SizedBox(
                              width: size.width * 0.7,
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
                              height: size.height*0.02,
                            ),
                            SizedBox(
                              width: size.width * 0.7,
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
                              height: size.height*0.03,
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
                                    width: size.width * 0.6,
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
                              height: size.height*0.03,
                            ),
                            SizedBox(
                              width: size.width * 0.7,
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
                                },
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
      ),
    ));
  }
}
