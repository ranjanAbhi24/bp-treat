import 'package:bp_treat/module/auth/controller/add_health_profile_controller.dart';
import 'package:bp_treat/module/auth/view/add_health_profile_page3.dart';
import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/pin_code_textfild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/size.dart';


class AddHealthProfilePage2 extends StatelessWidget {
  const AddHealthProfilePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                    SizedBox(height: size.height * 0.02),
                    Center(
                      child: Image.asset(
                        "assets/images/app_icon2.png",
                        height: size.height * 0.1,
                        width: size.width * 0.4,
                      ),
                    ),
                    Center(
                      child: Text("Health Profile(2 of 4)",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 30
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text("Please continue your health profile to get better recommendations.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: kBlackColor?.withOpacity(0.8)
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Text("How tall are you?",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.black
                        )
                    ),

                SizedBox(
                    height: size.height * 0.02
                    ),
                    Row(

                      children: [
                        PinCodeTextField(controller: controller.feetController,
                         maxLine: 1,
                          width: 50,
                        ),
                        SizedBox(
                           width: size.width * 0.02
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
                            width: size.width * 0.05
                        ),
                        PinCodeTextField(
                          controller: controller.inchesController,
                          maxLine: 1, width: 50,),
                        SizedBox(
                            width: size.width * 0.02
                        ),

                        Text("Inches",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black
                          ),
                        ),

                      ],
                    ),
                          SizedBox(
                              height: size.height * 0.02
                          ),
                          Text("How much do you weight?",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: Colors.black
                              )
                          ),
                          SizedBox(
                              height: size.height * 0.02
                          ),
                          Row(
                            children: [
                              PinCodeTextField(controller: controller.inchesController,
                                maxLine: 1,
                                width: 70,
                              ),
                              SizedBox(
                                  width: size.width * 0.02
                              ),

                              Text("Pounds",
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: size.height * 0.02
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
                              height: size.height * 0.01
                          ),
                          PinCodeTextField(
                              controller: controller.allergiesController,
                            maxLine: 5,
                              width: size.width),
                          SizedBox(
                              height: size.height * 0.04
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width*0.4,
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
                                width: size.width*0.4,
                                child: CommonElevatedButton(
                                    onTap: (){
                                      Get.to(()=>const AddHealthProfilePage3());
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
