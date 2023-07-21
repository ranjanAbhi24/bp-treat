import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/dashboard/controller/add_bp_controller.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/dashboard/view/menu_view.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/dashboard_controller.dart';

class AddBPView extends StatefulWidget {
  const AddBPView({super.key});

  @override
  State<AddBPView> createState() => _AddBPViewState();
}

class _AddBPViewState extends State<AddBPView> {
 var dashboardController= Get.find<DashboardController>();
  bool valuee = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: GetBuilder<AddBPController>(
            init: AddBPController(),
            builder: (controller) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Row(
                    //   children: [
                    //     IconButton(
                    //       icon: const Icon(Icons.arrow_back),
                    //       onPressed: () {
                    //         Get.back();
                    //       },
                    //     ),
                    //     // Text(
                    //     //     "Hello, ${Get.find<LandingController>().userInfo['data']['name']}",
                    //     //     style: Theme.of(context).textTheme.headline2),
                    //     const SizedBox(width: 6),
                    //     Image.asset('assets/images/waving_hand.png'),
                    //     const Spacer(),
                    //     IconButton(
                    //       icon: const Icon(Icons.info_rounded),
                    //       onPressed: () {
                    //         showAlertDialog(context);
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // Divider(
                    //   color: Colors.black38.withOpacity(0.4),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250.w,
                          child: Text("Record Blood Pressure",
textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: kBlackColor,
                            fontSize: 25.sp
                          )
                          ),
                        ),
                        IconButton(
                            onPressed: (){
                              MenuDialog().openMenuDialog();
                            }, icon: const Icon(Icons.menu,
                        size: 40,),

                        )
                      ],
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

                            style: Theme.of(context).textTheme!.bodyText2!.copyWith(
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
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      height: 230.h,
                      decoration: BoxDecoration(
                        // color: valuee == true
                        //     ? kBlackColor
                        //     : const Color(0XFFE2F5F6),
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
                                        text: "\nmin",
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              NumberPicker(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color:
                                        // valuee == true
                                        //     ? kWhiteColor:
                                            kBlackColor),
                                selectedTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 28,
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
                                step: 2,
                                haptics: true,
                                value: controller.systolicBPValue,
                                onChanged: controller.onSystolicValueChange,
                              ),
                              NumberPicker(
                                minValue: 50,
                                maxValue: 120,
                                step: 2,
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
                                        fontSize: 22,
                                        color:
                                        // valuee == true
                                        //     ? kWhiteColor:
                                             kBlackColor),
                                selectedTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 28,
                                        color: kPrimaryColor),
                              ),

                              NumberPicker(
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
                                        fontSize: 22,
                                        color:
                                        // valuee == true
                                        //     ? kWhiteColor:
                                             kBlackColor),
                                selectedTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 28,
                                        color: kPrimaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                 //   const SizedBox(height: 20),
                    // Text('Note',
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .headline2
                    //         ?.copyWith(color: kBlackColor?.withOpacity(0.7))),
                   // const SizedBox(height: 10),
                    // TextField(
                    //   controller: controller.noteController,
                    //   decoration: InputDecoration(
                    //       enabled: true,
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: kTealColor!),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: kTealColor!),
                    //       ),
                    //       hintText: 'Description',
                    //       hintStyle: Theme.of(context)
                    //           .textTheme
                    //           .subtitle1
                    //           ?.copyWith(
                    //               fontSize: 13,
                    //               fontWeight: FontWeight.w500,
                    //               color: kBlackColor?.withOpacity(0.4)),
                    //       suffixIcon: Container(
                    //         margin: const EdgeInsets.all(8),
                    //         decoration: BoxDecoration(
                    //           color: kTealColor,
                    //           borderRadius: BorderRadius.circular(8),
                    //         ),
                    //         child: Image.asset(
                    //           'assets/images/notes-medical.png',
                    //           color: kWhiteColor,
                    //         ),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(6),
                    //       )),
                    // ),
                   // SizedBox(height: size.height * 0.2),
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
              "If you have any type of emergency or you are feeling unconsious then you should call 911 or seek immediate help of physician.",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat-Medium",
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
