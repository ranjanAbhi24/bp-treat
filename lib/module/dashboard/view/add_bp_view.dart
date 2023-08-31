import 'package:bp_treat/widget/common_elevated_button.dart';
import 'package:bp_treat/module/dashboard/controller/add_bp_controller.dart';

import 'package:bp_treat/utils/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widget/common_header.dart';
import '../controller/dashboard_controller.dart';

class AddBPView extends StatefulWidget {
  const AddBPView({super.key});

  @override
  State<AddBPView> createState() => _AddBPViewState();
}

class _AddBPViewState extends State<AddBPView> {
 var dashboardController= Get.put(DashboardController());

  bool valuee = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
backgroundColor: kWhiteColor,
        body: GetBuilder<AddBPController>(
            init: AddBPController(),
            builder: (controller) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ListView(

                  children: [
                    const CommonHeader(title: 'Record Blood Pressure',
                      ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.video_camera_back_outlined,
                        color: kBlackColor,
                        ),
                        SizedBox(width: 10.w,),
                        GestureDetector(
                          onTap: () async {
                            await launchUrl(Uri.parse(
                                "https://www.youtube.com/watch?v=0tGyRJxbYpQ"));
                          },
                          child: Text(
                            "Learn how to take your blood pressure",

                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: kBlackColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      height: 260.h,

                      decoration: BoxDecoration(

                        border: Border.all(color: kGreyColor!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RichText(
                                textAlign:TextAlign.center,
                                  text: TextSpan(
                                      text: 'Systolic',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color:
                                              // valuee == true
                                              //     ? kWhiteColor:
                                                   kBlackColor),
                                      children: [
                                    TextSpan(
                                        text: "\nmmHg",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                // valuee == true
                                                //     ? kWhiteColor:
                                                     kBlackColor)),
                                  ])),
                              SizedBox(width: 6.w,),
                              RichText(
                                  textAlign:TextAlign.center,
                                  text: TextSpan(
                                      text: 'Diastolic',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                               color:
                                          // valuee == true
                                              //     ? kWhiteColor:
                                                   kBlackColor),
                                      children: [
                                    TextSpan(
                                        text: "\nmmHg",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                                color:
                                                // valuee == true
                                                //     ? kWhiteColor:
                                                     kBlackColor)),
                                  ])),
                              RichText(
                                  textAlign:TextAlign.center,
                                  text: TextSpan(
                                      text: 'Pulse',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color:
                                              // valuee == true
                                              //     ? kWhiteColor:
                                                   kBlackColor),
                                      children: [
                                    TextSpan(
                                        text: "\nbeats/minute  ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                                color:
                                                // valuee == true
                                                //     ? kWhiteColor:
                                                     kBlackColor)),
                                  ])),
                            ],
                          ),
                          SizedBox(
                           height:10.h
                          ),
                           Row(

                             children: [
                               Expanded(
                                 child: NumberPicker(
                                   textStyle: Theme.of(context)
                                       .textTheme
                                       .bodySmall
                                       ?.copyWith(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 20.sp,
                                           color:
                                           // valuee == true
                                           //     ? kWhiteColor:
                                               kBlackColor),
                                   selectedTextStyle: Theme.of(context)
                                       .textTheme
                                       .bodySmall
                                       ?.copyWith(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 25.sp,
                                           color: kPrimaryColor),
                                   decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       border: Border.all(
                                           color:
                                           // valuee == true
                                           //     ? kTealColor!
                                           //    :
                                           kBlackColor!)),
                                   minValue: 70,
                                   maxValue: 220,
                                   step: 1,
                                   haptics: true,
                                   value: controller.systolicBPValue,
                                   onChanged: controller.onSystolicValueChange,
                                 ),
                               ),
                                Expanded(
                                  child: NumberPicker(
                                   minValue: 50,
                                   maxValue: 120,
                                   step: 1,
                                   value: controller.diastolicBPValue,
                                   decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       border: Border.all(
                                           color:
                                           // valuee == true
                                           //     ? kTealColor! :
                                           kBlackColor!)),
                                   onChanged: controller.onDiastolicValueChange,
                                   textStyle: Theme.of(context)
                                       .textTheme
                                       .bodySmall
                                       ?.copyWith(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 20.sp,
                                           color:
                                           // valuee == true
                                           //     ? kWhiteColor:
                                                kBlackColor),
                                   selectedTextStyle: Theme.of(context)
                                       .textTheme
                                       .bodySmall
                                       ?.copyWith(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 25.sp,
                                           color: kPrimaryColor),
                               ),
                                ),

                                Expanded(
                                  child: NumberPicker(
                                   decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       border: Border.all(
                                           color:
                                           // valuee == true
                                           //     ? kTealColor!:
                                                kBlackColor!)),
                                   minValue: 44,
                                   maxValue: 152,
                                   step: 1,
                                   value: controller.pulseValue,
                                   onChanged: controller.onPulseValueChange,
                                   textStyle: Theme.of(context)
                                       .textTheme
                                       .bodySmall
                                       ?.copyWith(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 20.sp,
                                           color:
                                           // valuee == true
                                           //     ? kWhiteColor:
                                                kBlackColor),
                                   selectedTextStyle: Theme.of(context)
                                       .textTheme
                                       .bodySmall
                                       ?.copyWith(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 25.sp,
                                           color: kPrimaryColor),
                               ),
                                ),
                             ],
                           ),
                        ],
                      ),
                    ),

                    SizedBox(height: 90.h,),
                    Center(
                      child: SizedBox(
                        width: 150.w,
                        child: CommonElevatedButton(
                          onTap: () async {
                            await EasyLoading.show();
                            await controller.postRecord();
                            await EasyLoading.dismiss();
                          },
                          title: 'Save',
                          backgroundColor: kPrimaryColor,
                          textColor: kWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Text(
              "If you have any type of emergency or you are feeling unconscious then you should call 911 or seek immediate help of physician.",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat-Medium",
                  //fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
