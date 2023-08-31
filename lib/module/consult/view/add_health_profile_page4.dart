import 'package:bp_treat/module/consult/controller/add_health_profile_controller.dart';

import 'package:bp_treat/utils/show_snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';

import '../../../widget/common_elevated_button.dart';

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
      body: GetBuilder<AddHealthController>(
              init: AddHealthController(),
              builder: (controller) {
                return SingleChildScrollView(
                    child: Container(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Health Profile (4 of 4)",
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color:  const Color.fromRGBO(193, 65, 66, 1)
                        )
                      ),
                      SizedBox(height:5.h),
                      Text(
                        "Please continue your health profile to get better recommendations.",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.normal,
                            //fontSize: 13.sp,
                            color: kBlackColor,)
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: kGreyColor!.withOpacity(0.3),
                            border: Border.all(color: Colors.grey)

                        ),
                        child: Column(
                          children: [
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
                                            controller.selectedValueL1(controller.list1[index],index);
                                            print(controller.selectedIndexesL1);
                                          },
                                          child: controller.selectedIndexesL1.contains(index)?Icon(Icons.check_box,
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
                          ],
                        ),
                      ),


                      SizedBox(height: 20.h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: kGreyColor!.withOpacity(0.3),
                            border: Border.all(color: Colors.grey)

                        ),
                        child: Column(

                          children: [
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
                                          controller.selectedValueL2(controller.list2[index],index);
                                          print(controller.selectedIndexesL2);
                                        },
                                        child: controller.selectedIndexesL2.contains(index)?Icon(Icons.check_box,
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
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: kGreyColor!.withOpacity(0.3),
                            border: Border.all(color: Colors.grey)

                        ),
                        child: Column(
                          children: [
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
                          ],
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
                              if(controller.selectedIndexesL1.isNotEmpty && controller.selectedIndexesL2.isNotEmpty){
                                controller.addUserHealthDetail();
                                 // Get.to(() => const ProfileComplete());

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
