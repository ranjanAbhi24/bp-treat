import 'package:bp_treat/module/auth/controller/add_health_profile_controller.dart';
import 'package:flutter/material.dart';
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
        child: Scaffold(
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
                        height: size.height * 0.1,
                        width: size.width * 0.4,
                      ),
                    ),
                    Center(
                      child: Text("Health Profile(3 of 4)",
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

                    Text("Do you have diabetes?",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.black
                        )
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                         SizedBox(
                           width: 100,
                           height: 50,
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
                        SizedBox(width: size.width * 0.05),
                        SizedBox(
                          width: 100,
                          height: 50,
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
                    SizedBox(height: size.height * 0.02),
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
                        height: size.height * 0.01
                    ),
                    PinCodeTextField(
                        controller: controller.medicalConditionsController,
                        maxLine: 5,
                        width: size.width),
                    SizedBox(height: size.height * 0.02),
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
                        height: size.height * 0.01
                    ),
                    PinCodeTextField(
                        controller: controller.currentMedicationsController,
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
    ));
  }
}
