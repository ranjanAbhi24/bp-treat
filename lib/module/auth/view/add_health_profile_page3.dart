import 'package:bp_treat/module/auth/controller/add_health_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/size.dart';
import '../widget/common_elevated_button.dart';
import '../widget/pin_code_textfild.dart';
import 'add_health_profile_page4.dart';


class AddHealthProfilePage3 extends StatelessWidget {
  const AddHealthProfilePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
          Scaffold(
      body:GetBuilder<AddHealthController>(
            init: AddHealthController(),
            builder: (controller){
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/app_icon2.png",
                              height: 90.h,
                              width: 100.w
                          ),
                        ),
                        Center(
                          child: Text("Health Profile(3 of 4)",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 25.sp
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text("Please continue your health profile to get better recommendations.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                              color: kBlackColor?.withOpacity(0.8)
                          ),
                        ),
                        SizedBox(height:30.h),

                        Text("Do you have diabetes?",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: Colors.black
                            )
                        ),
                        SizedBox(height:20.h),
                        Row(
                          children: [
                             SizedBox(
                               width: 100.w,
                               height: 50.h,
                               child: InkWell(
                                 onTap: (){
                                  controller.confirmDiabetes("yes");
                                 },
                                 child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: controller.diabetesYes?kPrimaryColor:kGreyColor
                                  ),

                                  child: Center(child: Text("Yes",
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: controller.diabetesYes?kWhiteColor:kBlackColor
                                  ),
                                  )),
                            ),
                               ),
                             ),
                            SizedBox(width: 20.w),
                            SizedBox(
                              width: 100.w,
                              height: 50.h,
                              child: InkWell(
                                onTap: (){
                                  controller.confirmDiabetes("no");
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: controller.diabetesNo?kPrimaryColor:kGreyColor
                                  ),

                                  child: Center(child: Text("No",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color:controller.diabetesNo?kWhiteColor:kBlackColor
                                    ),
                                  )),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text('What medical conditions do you have?',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black
                          ),
                        ),
                        Text('(If none, please enter "none")',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(
                            height: 10.h
                        ),
                        PinCodeTextField(
                            controller: controller.medicalConditionsController,
                            maxLine: 5,
                            width: 360.w),
                        SizedBox(height: 20.h),
                        Text('What are your current medications?',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black
                          ),
                        ),
                        Text('(If none, please enter "none")',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(
                            height: 10.h
                        ),
                        PinCodeTextField(
                            controller: controller.currentMedicationsController,
                            maxLine: 5,
                            width: 360.w),
                        SizedBox(
                            height: 30.h
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 140.w,
                              child: CommonElevatedButton(
                                onTap: (){
                                  Get.back();
                                },
                                title: "Back",
                                backgroundColor: kGreyColor,
                                textColor: kBlackColor,
                              ),
                            ),
                            SizedBox(
                              width: 140.w,
                              child: CommonElevatedButton(
                                onTap: (){
                                  Get.to(()=>const AddHealthProfilePage4());
                                },
                                title: "Continue",
                                backgroundColor: kPrimaryColor,
                                textColor: kWhiteColor,
                              ),
                            ),

                          ],
                        )


                      ],
                    ),
                  ),
                ),
              );
            },
      )
    )

  );
  }
}
