import 'package:bp_treat/module/consult/controller/add_health_profile_controller.dart';
import 'package:bp_treat/module/consult/view/add_health_profile_page3.dart';
import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/pin_code_textfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/size.dart';


class AddHealthProfilePage2 extends StatelessWidget {
  const AddHealthProfilePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
             Scaffold(
              body: GetBuilder<AddHealthController>(
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
                          child: Text("Health Profile(2 of 4)",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 25.sp
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text("Please continue your health profile to get better recommendations.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                              color: kBlackColor?.withOpacity(0.8)
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Form(
                          key: controller.page2FormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("How tall are you?",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black
                                  )
                              ),

                              SizedBox(
                                  height: 20.h
                              ),
                              Row(

                                children: [
                                  PinCodeTextField(controller: controller.feetController,
                                    maxLine: 1,
                                    width: 50.w, validator: (value) {
                                     if(value!.isEmpty){
                                        return "Required *";
                                      }else{
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                      width: 5.w
                                  ),
                                  // SizedBox(
                                  //   width: size.width*0.13,
                                  //   height: size.height*0.2,
                                  //   child: InputTextField(
                                  //       controller:controller.feetController,
                                  //       validator: (value) {  },
                                  //   text: '',),
                                  // ),
                                  Text("Feet",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(
                                      width: 10.w
                                  ),
                                  PinCodeTextField(
                                    controller: controller.inchesController,
                                    maxLine: 1, width: 50.w, validator: (value) {
                                      if(value!.isEmpty){
                                        return "Required *";
                                      }else{
                                        return null;
                                      }
                                  },),
                                  SizedBox(
                                      width: 5.w
                                  ),

                                  Text("Inches",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: Colors.black
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(
                                  height: 20.h
                              ),
                              Text("How much do you weight?",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black
                                  )
                              ),
                              SizedBox(
                                  height: 20.h
                              ),
                              Row(
                                children: [
                                  PinCodeTextField(controller: controller.poundsController,
                                    maxLine: 1,
                                    width: 70.w, validator: (value) {
                                    if(value!.isEmpty){
                                        return "Required *";
                                      }else{
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                      width: 20.w
                                  ),

                                  Text("Pounds",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: Colors.black
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: 20.h
                              ),
                              Text('What allergies do you have?',
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
                                  controller: controller.allergiesController,
                                  maxLine: 5,
                                  width: 360.w, validator: (value) {
                                if(value!.isEmpty){
                                  return "Required *";
                                }else{
                                  return null;
                                }
                              },),
                              SizedBox(
                                  height: 40.h
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
                                        if(controller.page2FormKey.currentState!.validate()){
                                          Get.to(()=>const AddHealthProfilePage3());
                                        }
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
