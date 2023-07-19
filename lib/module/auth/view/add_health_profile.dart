import 'package:bp_treat/module/auth/controller/add_health_profile_controller.dart';
import 'package:bp_treat/module/auth/view/add_health_profile_page2.dart';
import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/utils/show_snackbar.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';


import '../../../utils/app_theme.dart';
import '../../../utils/size.dart';


class AddHealthProfile extends StatelessWidget {
  const AddHealthProfile({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child:
             GetBuilder<AddHealthController>(
              init: AddHealthController(),
              builder: (controller){
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    child:  Column(
                      children: [

                        Image.asset(
                          "assets/images/app_icon2.png",
                            height: 90.h,
                            width: 100.w
                        ),
                        Text("Health Profile(1 of 4)",
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 25.sp
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text("Please continue your health profile to get better recommendations.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                              color: kBlackColor?.withOpacity(0.8)
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text("What is your biological gender?",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: Colors.black
                            )
                        ),
                        SizedBox(
                            height: 20.h
                        ),
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           GestureDetector(
                           onTap:(){
                  controller.selectGender("male");
                  },


                           child: Container(
                             padding: const EdgeInsets.all(30),
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               //     borderRadius: const BorderRadius.all(Radius.circular(100)),
                               border: Border.all(color: controller.isMale ?Colors.red:Colors.grey,),
                             ),
                             child:  const Center(
                               child: Text("Male"),
                             ),
                           ),
                         ),
                            // CustomRadioButton(text: 'Male', onTap: (){
                            //   controller.selectMale();
                            // }, selectedColor: controller.isMale.value?Colors.red:Colors.grey, ),
                            GestureDetector(
                              onTap:
                              (){
                                controller.selectGender("Female");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  //     borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  border: Border.all(color: controller.isFemale ?Colors.red:Colors.grey,),
                                ),
                                child:  const Center(
                                  child: Text("Female"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:20.h),
                        Text("When were you born?",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: Colors.black
                            )
                        ),
                        SizedBox(
                          height: 240.h,
                          child: ScrollDatePicker(
                             indicator: const Text(""),
                             scrollViewOptions: const DatePickerScrollViewOptions(
                               year: ScrollViewDetailOptions(
                                 margin: EdgeInsets.all(5),
                                 textStyle: TextStyle(
                                   color: Colors.black
                                 )
                               ),
                               month: ScrollViewDetailOptions(
                                   margin: EdgeInsets.all(5),
                                   textStyle: TextStyle(
                                       color: Colors.black
                                   )
                               ),
                               day: ScrollViewDetailOptions(
                                   margin: EdgeInsets.all(5),
                                   textStyle: TextStyle(
                                       color: Colors.black
                                   )
                               ),
                             ),
                              selectedDate: controller.selectDate,
                              onDateTimeChanged: (value){
                                controller.dateTimeChanged(value);
                              }
                          ),
                        ),
                        // SpinnerDateTimePicker(
                        //   mode: CupertinoDatePickerMode.date,
                        //     initialDateTime: DateTime.now(),
                        //     maximumDate: DateTime.now().add(const Duration(days: 7)),
                        //     minimumDate: DateTime.now().subtract(const Duration(days: 1)),
                        //     didSetTime: (value){}
                        // )
                        SizedBox(
                          width:200.w,
                          child: CommonElevatedButton(
                              onTap: (){
                                if(controller.select_gender.isNotEmpty && controller.dob.isNotEmpty){
                                  Get.to(()=> const AddHealthProfilePage2());
                                }
                                else{
                                  if(controller.select_gender.isEmpty && controller.dob.isEmpty){
                                    ApplicationUtils.showSnackBar(
                                        titleText: "Alert",
                                        messageText: "Select the values");
                                  }else if(controller.select_gender.isEmpty){
                                    ApplicationUtils.showSnackBar(
                                        titleText: "Alert",
                                        messageText: "Select your biological gender");
                                  }else{
                                    ApplicationUtils.showSnackBar(
                                        titleText: "Alert",
                                        messageText: "Select your dob");
                                  }
                                }
                              },
                              title: "Continue",
                            backgroundColor: kPrimaryColor,
                            textColor: kWhiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )

    );
  }
}
