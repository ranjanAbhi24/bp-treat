import 'package:bp_treat/module/consult/controller/add_health_profile_controller.dart';
import 'package:bp_treat/module/consult/view/add_health_profile_page3.dart';
import 'package:bp_treat/widget/common_elevated_button.dart';
import 'package:bp_treat/widget/pin_code_textfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';



class AddHealthProfilePage2 extends StatelessWidget {
  const AddHealthProfilePage2({super.key});

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
                builder: (controller){
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                        Text("Health Profile (2 of 4)",
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: const Color.fromRGBO(193, 65, 66, 1)
                          )
                        ),
                        SizedBox(height: 5.h),
                        Text("Please continue your health profile to get better recommendations.",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.normal,
                              //fontSize: 13.sp,
                              color: kBlackColor
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Form(
                          key: controller.page2FormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                          inputType: TextInputType.number,
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
                                            width: 10.w
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
                                              color: Colors.black,
                                            fontWeight: FontWeight.normal
                                          ),
                                        ),
                                        SizedBox(
                                            width: 20.w
                                        ),
                                        PinCodeTextField(
                                          inputType: TextInputType.number,
                                          controller: controller.inchesController,
                                          maxLine: 1, width: 50.w, validator: (value) {
                                          if(value!.isEmpty){
                                            return "Required *";
                                          }else{
                                            return null;
                                          }
                                        },),
                                        SizedBox(
                                            width: 10.w
                                        ),

                                        Text("Inches",
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),


                              SizedBox(
                                  height: 20.h
                              ),
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
                                    Text("How much do you weigh?",
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
                                          inputType: TextInputType.number,
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
                                              color: Colors.black,
                                            fontWeight: FontWeight.normal
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                  height: 20.h
                              ),
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
                                    Text('What allergies do you have?',
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          color: Colors.black
                                      ),
                                    ),
                                    Text('(If none, please enter "none")',
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                    SizedBox(
                                        height: 10.h
                                    ),
                                    SizedBox(
                                      width: 360.w,
                                      child: TextFormField(
                                        controller: controller.allergiesController,
                                        maxLines: 4,
                                         decoration: InputDecoration(
                                           contentPadding: const EdgeInsets.all(10),
                                           focusedBorder: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(12),
                                               //  borderSide: BorderSide.none,
                                               borderSide: const BorderSide(color: Colors.black)
                                           ),
                                           border: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(12),
                                               //  borderSide: BorderSide.none,
                                               borderSide: const BorderSide(color: Colors.black)
                                           ),
                                         ),
                                         validator: (value) {
                                        if(value!.isEmpty){
                                          return "Required *";
                                        }else{
                                          return null;
                                        }
                                      },),
                                    ),

                                  ],
                                ),
                              ),
SizedBox(
  height: 20.h,
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
