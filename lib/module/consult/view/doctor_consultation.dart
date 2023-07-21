import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/consult/controller/consent_controller.dart';
//import 'package:bp_treat/module/consult/view/first_consent_form.dart';
import 'package:bp_treat/module/dashboard/view/landing_page.dart';
import 'package:bp_treat/module/doctor/view/doctor_selection_screen.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorConsultationConsent extends StatelessWidget {
  const DoctorConsultationConsent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ConsentController>(
            init: ConsentController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.04),
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.headline2,
                          text: 'If you do not choose a',
                          children: [
                            TextSpan(
                              text: ' Doctor',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(color: kPrimaryColor),
                            ),
                            TextSpan(
                              text: ', you will not receive these benefits',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ]),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "\u2022 Medication management of blood pressure",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 13),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "\u2022 Electronic prescriptions",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 13),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "\u2022 Reminders to take blood pressure",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 13),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "\u2022 Communication with a physician via the App",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 13),
                    ),
                    const SizedBox(height: 30.0),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Checkbox(
                    //       activeColor: kPrimaryColor,
                    //       materialTapTargetSize:
                    //           MaterialTapTargetSize.shrinkWrap,
                    //       side: BorderSide(color: kPrimaryColor!, width: 2),
                    //       checkColor: Colors.white,
                    //       value: controller.ischecked,
                    //       onChanged: controller.toggleCheckBox,
                    //     ),
                    //     const SizedBox(width: 5.0),
                    //     Flexible(
                    //       child: Text(
                    //         "Check this checkbox, to consult the doctor. We will send you a email regarding this.",
                    //         style:
                    //             Theme.of(context).textTheme.bodyText2?.copyWith(
                    //                   fontSize: 12,
                    //                   fontWeight: FontWeight.w500,
                    //                 ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: CommonElevatedButton(
                                onTap: () {
                                  Get.to(() => const DoctorSelectionScreen());
                                },
                                title: 'Select Doctor',
                              backgroundColor: kPrimaryColor,
                              textColor: kWhiteColor,)),
                        // const SizedBox(width: 10),
                        // Expanded(
                        //   flex: 1,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       elevation: 0.0,
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: const BorderRadius.all(
                        //               Radius.circular(12)),
                        //           side: BorderSide(color: kPrimaryColor!)),
                        //       backgroundColor: Colors.white,
                        //       fixedSize: Size(
                        //         size.width,
                        //         50,
                        //       ),
                        //     ),
                        //     onPressed: () {
                        //       Get.to(() => const LandingPage());
                        //     },
                        //     child: const Text(
                        //       'Skip',
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: CommonElevatedButton(
                                onTap: () {
                                 // Get.to(() => const FirstConsentForm());
                                },
                                title: 'Continue',
                              backgroundColor: kPrimaryColor, textColor: kWhiteColor,)),
                      ],
                    ),
                    SizedBox(height: size.height * 0.06),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
