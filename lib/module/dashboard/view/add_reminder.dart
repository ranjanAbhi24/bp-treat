import 'package:bp_treat/widget/common_elevated_button.dart';
import 'package:bp_treat/module/dashboard/controller/add_reminder_controller.dart';
import 'package:bp_treat/widget/common_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_theme.dart';



class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
            color: kBlackColor,
          ),
        ),
        backgroundColor: kWhiteColor,
          body: SingleChildScrollView(
            child: GetBuilder<AddReminderController>(
              init: AddReminderController(),
              builder: (controller){
                return Container(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Text("Reminders",
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                              //fontSize: 25.sp
                              color: const Color.fromRGBO(193, 65, 66, 1)
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: Text("Let's set a reminder for when you are past due for taking your blood pressure.",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontWeight: FontWeight.normal,
                               // fontSize: 14.sp,
                                color: kBlackColor
                            ),
                          ),
                        ),
                        SizedBox(height:20.h),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: kGreyColor!.withOpacity(0.3),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("How often does your doctor advise you to take your blood pressure?",
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: kBlackColor
                                ),
                              ),
                              SizedBox(height:10.h),
                              Container(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(12)),
                                child: DropDownWidget(dropdownValue: controller.dropdown1, items: controller.items1, onChange: (value ) {
                                  controller.onChangeValue1(value!);
                                },),
                              ),
                              SizedBox(height:30.h),
                              Text("What is Your time zone?",
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: kBlackColor
                                ),
                              ),
                              SizedBox(height:10.h),
                              Container(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(12)),
                                child: DropDownWidget(dropdownValue: controller.dropdown2, items: controller.items2,
                                  onChange: (value) {
                                    controller.onChangedValue2(value!);
                                  },),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height:10.h),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: kGreyColor!.withOpacity(0.3),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Column(
                            children: [
                              Text("At what time would you like to be reminded if you haven't yet taken your blood pressure?",
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: kBlackColor
                                  )),
                              SizedBox(height: 20.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Container(
                                        width: 70.w,
                                        height: 70.h,
                                        color: kGreyColor,
                                        child: Center(
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            cursorColor: kBlackColor,
                                            controller: controller.hourController,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(

                                                fontWeight: FontWeight.w500,
                                                color: kBlackColor,
                                                fontSize: 40.sp
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.zero,
                                              fillColor: kGreyColor,
                                              filled: true,

                                            ),
                                          ),
                                        ),
                                      ),
                                      Text("Hour",
                                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text(":",
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.w500,
                                            color: kBlackColor
                                        ),
                                      )
                                    // ImageIcon(AssetImage("assets/images/colon.png"),size: 60,)
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 70.w,
                                        height: 70.h,
                                        color: kGreyColor,
                                        child: Center(
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            cursorColor: kBlackColor,
                                            controller: controller.minuteController,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: kBlackColor,
                                                fontSize: 40.sp
                                            ),
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.zero,
                                                fillColor: kGreyColor,
                                                filled: true
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text("Minute",
                                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                              color: kBlackColor,
                                              fontWeight: FontWeight.w400
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              controller.selectMeridian("AM");

                                            },
                                            child: Container(
                                              height: 30.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(2),
                                                  border: Border.all(color: kGreyColor!),
                                                  color: controller.meridian=="AM"?Colors.pink[50]:kGreyColor
                                              ),
                                              child:  Center(child: Text("AM",
                                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: controller.meridian=="AM"?kPrimaryColor:kBlackColor
                                                  )
                                              ),),),
                                          ),
                                          SizedBox(width: 5.w,),
                                          InkWell(
                                            onTap: (){
                                              controller.selectMeridian("PM");

                                            },
                                            child: Container(
                                              height: 30.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(2),
                                                  border: Border.all(color: kGreyColor!),
                                                  color: controller.meridian=="PM"?Colors.pink[50]:kGreyColor
                                              ),
                                              child: Center(child: Text("PM",
                                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: controller.meridian=="PM"?kPrimaryColor:kBlackColor
                                                  )
                                              ),),),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h,),

                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 40.h,
                        ),
                        Center(
                          child: SizedBox(
                            width: 180.w,
                            child: CommonElevatedButton(
                                onTap: (){
                                  controller.setReminder();
                                },
                                title: "Finish",
                                backgroundColor: kPrimaryColor,
                                textColor: kWhiteColor),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ),
      ),
    );
  }
}
