import 'package:bp_treat/module/auth/controller/register_controller.dart';
import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Create Login ",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      // const SizedBox(height: 5),
                      // Text(
                      //   "Please fill all the required details to get register into the App",
                      //   style: Theme.of(context).textTheme.bodyText2,
                      // ),
                      const SizedBox(height: 20.0),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputTextField(
                                text: 'Name*',
                                controller: controller.userNameController,
                                inputType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required*';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 20),
                            InputTextField(
                              text: "Email*",
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
                            // const SizedBox(height: 20),
                            // InputTextField(
                            //   text: "Phone*",
                            //   controller: controller.userPhoneNumberController,
                            //   inputType: TextInputType.number,
                            //   inputFormatters: [
                            //     FilteringTextInputFormatter.digitsOnly
                            //   ],
                            //   validator: (value) {
                            //     if (value!.isEmpty) {
                            //       return 'Required*';
                            //     } else if (value.length != 10) {
                            //       return 'Mobile number must be 10 digit';
                            //     }
                            //     return null;
                            //   },
                            // ),
                            // const SizedBox(height: 20),
                            // Row(
                            //   children: [
                            //     Flexible(
                            //       child: Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           InputTextField(
                            //               text: "State*",
                            //               controller:
                            //                   controller.userStateController,
                            //               inputType: TextInputType.text,
                            //               validator: (value) {
                            //                 if (value!.isEmpty) {
                            //                   return 'Required*';
                            //                 } else if (GetUtils.isNum(value)) {
                            //                   return 'Please enter correct state name';
                            //                 } else {
                            //                   return null;
                            //                 }
                            //               })
                            //         ],
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       width: 10,
                            //     ),
                            //     Flexible(
                            //       child: Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           InputTextField(
                            //             text: "Zip*",
                            //             controller:
                            //                 controller.userZipcodeController,
                            //             inputType: TextInputType.number,
                            //             inputFormatters: [
                            //               FilteringTextInputFormatter.digitsOnly
                            //             ],
                            //             validator: (value) {
                            //               if (value!.isEmpty) {
                            //                 return 'Required*';
                            //               } else if (value.length != 5) {
                            //                 return 'Zip code must be 5 digit';
                            //               } else if (!GetUtils.isNum(value)) {
                            //                 return 'Please enter correct zipcode';
                            //               }
                            //               return null;
                            //             },
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InputTextField(
                                        text: "Password*",
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
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InputTextField(
                                        text: "Confirm Password*",
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kPrimaryColor,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              side: BorderSide(color: kPrimaryColor!, width: 2),
                              checkColor: Colors.white,
                              value: controller.isChecked,
                              onChanged: controller.toggleCheckBox,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "I agree to terms and conditions and",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                            fontSize: 12,
                                            color:
                                                kBlackColor?.withOpacity(0.8)),
                                    children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launchUrl(
                                              Uri.parse(
                                                  'https://app.houstonepilepsy.com/privacy-policy'),
                                              mode: LaunchMode.platformDefault);
                                        },
                                      text: " Privacy Policy",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              fontSize: 14,
                                              color: kPrimaryColor))
                                ]))
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      CommonElevatedButton(
                        title: 'Register',
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
                      const SizedBox(height: 10.0),
                      RichText(
                        text: TextSpan(
                            text: "Already have an account?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: kBlackColor?.withOpacity(0.8)),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.off(() => const LoginScreen());
                                    },
                                  text: " Sign In",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          fontSize: 15, color: kPrimaryColor))
                            ]),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
