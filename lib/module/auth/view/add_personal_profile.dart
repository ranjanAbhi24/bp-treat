import 'package:bp_treat/module/auth/controller/add_profile_controller.dart';
import 'package:bp_treat/module/auth/view/add_health_profile.dart';
import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/size.dart';


class AddPersonalProfile extends StatelessWidget {
  const AddPersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProfileController());
    return SafeArea(
        child:
        Scaffold(
              backgroundColor: Colors.white,
              body: GetBuilder<AddProfileController>(
                init: AddProfileController(),
                builder: (controller){
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.h),
                            Image.asset(
                              "assets/images/app_icon2.png",
                                height: 90.h,
                                width: 100.w
                            ),
                            Text("Your Personal Profile",
                              style: Theme.of(context).textTheme.headline1!.copyWith(
                                  fontSize: 25.sp
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text("Let's complete your personal profile so that a doctor may contact you.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline4!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: kBlackColor?.withOpacity(0.8)
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Form(
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 250.w,
                                      child: InputTextField(
                                          controller: controller.phoneNumberController,
                                          inputType: TextInputType.number,
                                          validator: (value){},
                                          text: "Phone number"
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      width: 250.w,
                                      child: InputTextField(
                                          controller: controller.zipCodeController,
                                          validator: (value){},
                                          text: "Zip code"
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text("Next, we will create your health profile.",
                                        style:Theme.of(context).textTheme.bodyText2!.copyWith(
                                            color: Colors.black
                                        )
                                    ),
                                    SizedBox(
                                      height: 90.h,
                                    ),
                                    SizedBox(
                                      width:200.w,
                                      child: CommonElevatedButton(
                                          onTap: (){
                                            Get.to(()=>const AddHealthProfile());
                                          },
                                          title: "Continue", backgroundColor: kPrimaryColor,
                                        textColor: kWhiteColor,
                                      ),
                                    )
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
            )


    );
  }
}
