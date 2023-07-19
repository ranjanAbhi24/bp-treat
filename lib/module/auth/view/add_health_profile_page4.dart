import 'package:bp_treat/module/auth/controller/add_health_profile_controller.dart';
import 'package:bp_treat/module/auth/view/profile_complete.dart';
import 'package:bp_treat/utils/show_snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/size.dart';
import '../widget/common_elevated_button.dart';

class AddHealthProfilePage4 extends StatefulWidget {
  const AddHealthProfilePage4({super.key});

  @override
  State<AddHealthProfilePage4> createState() => _AddHealthProfilePage4State();
}

class _AddHealthProfilePage4State extends State<AddHealthProfilePage4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
            Scaffold(
      body: GetBuilder<AddHealthController>(
              init: AddHealthController(),
              builder: (controller) {
                return SingleChildScrollView(
                    child: Container(
                  padding: const EdgeInsets.all(32),
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
                        child: Text(
                          "Health Profile(4 of 4)",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 25.sp,
                              ),
                        ),
                      ),
                      SizedBox(height:5.h),
                      Text(
                        "Please continue your health profile to get better recommendations.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                            color: kBlackColor?.withOpacity(0.8)),
                      ),
                      SizedBox(height: 30.h),
                      Text("Which of the following do you smoke?",
                          //textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10.h),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                       shrinkWrap: true,
                        itemCount: controller.list1.length,
                          itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap:(){
                             controller.selectedValueL1(controller.list1[index]);
                          },
                                  child: controller.select_list1_value==controller.list1[index]?Icon(Icons.check_box,
                                  color: kPrimaryColor,
                                  ):
                                  const Icon(Icons.check_box_outline_blank),
                                ),
                                const SizedBox(width: 10,),
                                Text(controller.list1[index],
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),
                                )
                              ],
                            ),
                          );

                          }),

                      SizedBox(height: 5.h),
                      Text(
                        "Which of the following do you take?",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                      SizedBox(height: 10.h),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: controller.list2.length,
                      itemBuilder: (context,index){
                        return  Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              InkWell(
                                onTap:(){
                                  controller.selectedValueL2(controller.list2[index]);
                                  print(controller.select_list2_value);
                                },
                                child: controller.select_list2_value==controller.list2[index]?Icon(Icons.check_box,
                                  color: kPrimaryColor,
                                ):
                                const Icon(Icons.check_box_outline_blank),
                              ),
                              const SizedBox(width: 10,),
                              Text(controller.list2[index],
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                      SizedBox(height: 5.h),
                      Text(
                        "Which is the most number of drinks you might have in a day?",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 360.w,
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_up_sharp),
                          elevation: 0,
                          value: controller.dropDownValue,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                          underline: const SizedBox.shrink(),
                          items: controller.dropdownList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (value) => controller
                              .onChangeValue(value ?? 'Select a choice..'),
                        ),
                      ),
                      SizedBox(height:20.h),
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
//Get.to(()=> const ProfileComplete());
                              if(controller.select_list1_value.isNotEmpty && controller.select_list2_value.isNotEmpty){
                                controller.addUserHealthDetail();
                              }else{
                                ApplicationUtils.showSnackBar(titleText: "Alert", messageText: "Something is missing");
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
                ));
              }),
    )

        );
  }
}
