import 'package:bp_treat/module/auth/controller/add_profile_controller.dart';
import 'package:bp_treat/module/auth/view/add_health_profile.dart';
import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/size.dart';


class AddPersonalProfile extends StatelessWidget {
  const AddPersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProfileController());
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: GetBuilder<AddProfileController>(
            init: AddProfileController(),
            builder: (controller){
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.06),
                        Image.asset(
                          "assets/images/app_icon2.png",
                          height: size.height * 0.1,
                          width: size.width * 0.4,
                        ),
                        Text("Your Personal Profile",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text("Let's complete your personal profile so that a doctor may contact you.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: kBlackColor?.withOpacity(0.8)
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.09,
                        ),
                        Form(
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: size.width * 0.7,
                                  child: InputTextField(
                                      controller: controller.phoneNumberController,
                                      inputType: TextInputType.number,
                                      validator: (value){},
                                      text: "Phone number"
                                  ),
                                ),
                                SizedBox(
                                  height: size.width * 0.05,
                                ),
                                SizedBox(
                                  width: size.width * 0.7,
                                  child: InputTextField(
                                      controller: controller.zipCodeController,
                                      validator: (value){},
                                      text: "Zip code"
                                  ),
                                ),
                                SizedBox(
                                  height: size.width * 0.05,
                                ),
                                Text("Next, we will create your health profile.",
                                    style:Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: Colors.black
                                    )
                                ),
                                SizedBox(
                                  height: size.width * 0.2,
                                ),
                                SizedBox(
                                  width: size.width * 0.7,
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
