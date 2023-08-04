import 'package:bp_treat/module/consult/controller/add_health_profile_controller.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';

import '../../../widget/common_elevated_button.dart';
import '../../../widget/pin_code_textfild.dart';
import 'add_health_profile_page4.dart';


class AddHealthProfilePage3 extends StatelessWidget {
  const AddHealthProfilePage3({super.key});

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
      body:GetBuilder<AddHealthController>(
            init: AddHealthController(),
            builder: (controller){
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
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
                          child: Text("Health Profile (3 of 4)",
                            style: Theme.of(context).textTheme.headline1
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text("Please continue your health profile to get better recommendations.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w600,

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
                     Form(
                       key: controller.page3FormKey,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
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
                             width: 360.w,
                             validator: (value) {
                               if(value!.isEmpty){
                                 return "Required *";
                               }else{
                                 return null;
                               }
                             },),
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
                             width: 360.w,
                             validator: (value) {
                               if(value!.isEmpty){
                                 return "Required *";
                               }else{
                                 return null;
                               }
                             },),
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
                                     if(controller.page3FormKey.currentState!.validate() && controller.haveDiabetes.isNotEmpty){
                                       Get.to(()=>const AddHealthProfilePage4());
                                     }
                                     if(controller.haveDiabetes.isEmpty){
                                       ApplicationUtils.showSnackBar(titleText: "Alert", messageText: "select you have diabetes yes or no ");
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
